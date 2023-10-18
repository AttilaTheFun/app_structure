import Combine
import SceneLifeCycleServiceInterface
import SwiftFoundation
import UIKit

public final class SharedSceneLifeCycleServiceImplementation {
    // MARK: Properties

    private var activationStateMap = [ObjectIdentifier: UIScene.ActivationState]()
    private var activationStateSubject = CurrentValueSubject<UIScene.ActivationState, Never>(.unattached)
    private var services = [ObjectIdentifier: (AnyWeakWrapper, Cancellable)]()

    // MARK: Initialization

    public init() {}
}

extension SharedSceneLifeCycleServiceImplementation: SharedSceneLifeCycleService {
    public var activationState: UIScene.ActivationState {
        self.activationStateSubject.value
    }

    public var activationStatePublisher: AnyPublisher<UIScene.ActivationState, Never> {
        self.activationStateSubject.eraseToAnyPublisher()
    }

    public func add(service: SceneLifeCycleService) {
        let objectIdentifier = ObjectIdentifier(service)

        let cancellable = service.activationStatePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] activationState in
                guard let self else { return }
                self.activationStateMap[objectIdentifier] = activationState
                let maxActivationState = self.activationStateMap.values
                    .reduce(.unattached) { maxActivationState, activationState in
                        activationState > maxActivationState ? activationState : maxActivationState
                    }

                if maxActivationState != self.activationState {
                    self.activationStateSubject.send(maxActivationState)
                }
            }

        self.services[objectIdentifier] = (AnyWeakWrapper(object: service), cancellable)
    }

    public func remove(service: SceneLifeCycleService) {
        let objectIdentifier = ObjectIdentifier(service)

        guard let (_, cancellable) = services[objectIdentifier]
        else {
            return
        }

        cancellable.cancel()
        self.services[objectIdentifier] = nil
    }
}

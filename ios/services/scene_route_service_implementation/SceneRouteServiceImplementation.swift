import KeyFoundation
import SceneLifeCycleServiceInterface
import SceneRouteServiceInterface
import SwiftFoundation
import UIKit

public final class SceneRouteServiceImplementation {
    // MARK: Properties

    private var objectIdentifiersToWeakServices = [ObjectIdentifier: AnyWeakWrapper]()
    private var objectIdentifiersNamespacesToWeakValueMaps = [ObjectIdentifier: [Namespace: AnyWeakWrapper]]()

    // MARK: Initialization

    public init() {}
}

extension SceneRouteServiceImplementation: SceneRouteService {
    public func getAll<T>() -> [T] {
        let namespace = Namespace(type: T.self)
        return self.objectIdentifiersNamespacesToWeakValueMaps.values.compactMap { namespacesToWeakValues -> T? in
            guard let value = namespacesToWeakValues[namespace]?.object as? T
            else {
                return nil
            }

            return value
        }
    }

    private func preferredObjectIdentifiers() -> [ObjectIdentifier] {
        let objectIdentifiersToServices = self.objectIdentifiersToWeakServices.compactMapValues { weakWrapper in
            weakWrapper.object as? SceneLifeCycleService
        }

        let sortedObjectIdentifiersToServices = objectIdentifiersToServices.sorted { left, right -> Bool in
            if left.value.activationState != right.value.activationState {
                return left.value.activationState < right.value.activationState
            }

            return left.key.hashValue < right.key.hashValue
        }

        return sortedObjectIdentifiersToServices.map(\.key)
    }

    public func get<T>() -> T? {
        let preferredObjectIdentifiers = preferredObjectIdentifiers()
        let namespace = Namespace(type: T.self)
        for objectIdentifier in preferredObjectIdentifiers {
            guard let namespacesToWeakValues = objectIdentifiersNamespacesToWeakValueMaps[objectIdentifier]
            else {
                continue
            }

            if let value = namespacesToWeakValues[namespace]?.object as? T {
                return value
            }
        }

        return nil
    }

    public func set<T>(implementation: AnyObject, interface: T.Type, sceneLifeCycleService: SceneLifeCycleService) {
        guard implementation is T
        else {
            return assertionFailure("Invalid implementation")
        }

        let objectIdentifier = ObjectIdentifier(sceneLifeCycleService)
        self.objectIdentifiersToWeakServices[objectIdentifier] = AnyWeakWrapper(object: sceneLifeCycleService)

        let namespace = Namespace(type: interface)
        var namespacesToWeakValues = self.objectIdentifiersNamespacesToWeakValueMaps[objectIdentifier, default: [:]]
        namespacesToWeakValues[namespace] = AnyWeakWrapper(object: implementation)
        self.objectIdentifiersNamespacesToWeakValueMaps[objectIdentifier] = namespacesToWeakValues
    }

    public func removeValues(sceneLifeCycleService: SceneLifeCycleService) {
        let objectIdentifier = ObjectIdentifier(sceneLifeCycleService)
        self.objectIdentifiersToWeakServices[objectIdentifier] = nil
        self.objectIdentifiersNamespacesToWeakValueMaps[objectIdentifier] = nil
    }
}

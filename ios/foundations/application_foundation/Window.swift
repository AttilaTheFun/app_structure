import Combine
import UIKit

/**
 The Window class represents one instance of the application's interface.
 There could potentially be multiple windows on screen (or in the background) at once.
 */
public final class Window: UIWindow {
    // MARK: Properties

    private let rootScopeProvider: RootScopeProvider
    private var cancellables = Set<AnyCancellable>()

    // MARK: Initialization

    public init(
        windowScene: UIWindowScene,
        rootScopeProvider: RootScopeProvider
    ) {
        // Save a reference to the root scope provider:
        self.rootScopeProvider = rootScopeProvider

        super.init(windowScene: windowScene)

        // Set the initial root view controller:
        rootViewController = self.rootScopeProvider.rootScope.buildRootViewController()

        // Observe the subject skipping the first event as it's redundant:
        self.rootScopeProvider
            .rootScopePublisher
            .dropFirst(1)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] rootScope in
                guard let self else { return }

                // Update the root view controller:
                setRootViewController(rootScope.buildRootViewController(), animated: true)
            })
            .store(in: &self.cancellables)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Overrides

    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        super.hitTest(point, with: event)
    }

    // MARK: Private

    private func setRootViewController(_ viewController: UIViewController, animated: Bool = true) {
        DispatchQueue.main.async {
            if self.rootViewController == nil || !animated {
                self.rootViewController = viewController
                return
            }

            guard let snapshot = self.snapshotView(afterScreenUpdates: true)
            else {
                self.rootViewController = viewController
                return
            }

            viewController.view.addSubview(snapshot)
            self.rootViewController = viewController
            UIView.animate(
                withDuration: 0.5,
                animations: {
                    snapshot.alpha = 0
                },
                completion: { _ in
                    snapshot.removeFromSuperview()
                }
            )
        }
    }
}

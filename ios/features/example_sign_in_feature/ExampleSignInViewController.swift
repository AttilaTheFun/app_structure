import UIKit

final class ExampleSignInViewController: UIViewController {

    // MARK: Properties

    private let signInButton = UIButton()

    // MARK: Injected Dependencies

    private let dependencies: ExampleSignInDependencies

    // MARK: Initialization

    init(dependencies: ExampleSignInDependencies) {
        self.dependencies = dependencies
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the views:
        self.view.backgroundColor = .white
        // self.signInButton.setTitle
    }
}
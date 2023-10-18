import Combine
import UIKit

final class ExampleSignInViewController: UIViewController {

    // MARK: Properties

    private let signInButton = UIButton()
    private var cancellables = Set<AnyCancellable>()

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
        self.view.addSubview(self.signInButton)
        self.signInButton.translatesAutoresizingMaskIntoConstraints = false
        self.signInButton.configuration = .filled()
        self.signInButton.setTitle("Sign In", for: .normal)
        self.signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)

        // Create the constraints:
        NSLayoutConstraint.activate([
            self.signInButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.signInButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.signInButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            self.signInButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }

    // MARK: Private

    @objc private func signInButtonTapped(_ button: UIButton) {
        self.dependencies.exampleAuthenticationService.logIn(username: "username", password: "password")
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure = completion {
                    print("error")
                }
            } receiveValue: { [weak self] session in
                self?.dependencies.exampleSignInCompleter.completeSignIn(with: session)
            }
            .store(in: &self.cancellables)

    }
}

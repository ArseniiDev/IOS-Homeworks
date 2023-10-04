//
//  Created by Arseniy Gusev on 4/5/23.
//

import UIKit



class LogInViewController: UIViewController,UITextFieldDelegate {


    var loginDelegate:LoginViewControllerDelegate?



//   struct LoginInspector: LoginViewControllerDelegate {
//        func check(login: String, password: String) -> Bool {
//            return Checker.shared.check(login: login, password: password)
//        }
//    }
    

    // MARK: - Subviews

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"vk-logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()


    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()

        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .white

        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    private lazy var login: UITextField = {[unowned self] in
        let label = UITextField()
        label.translatesAutoresizingMaskIntoConstraints = false
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: label.frame.height))
        label.leftView = paddingView
        label.leftViewMode = .always

        label.keyboardType = UIKeyboardType.default
        label.returnKeyType = UIReturnKeyType.done
        label.clearButtonMode = UITextField.ViewMode.whileEditing
        label.autocapitalizationType = .none

        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
            label.widthAnchor.constraint(equalToConstant: 150).isActive = true
        label.font = UIFont.systemFont(ofSize: 16)
        label.placeholder = "Login"

        label.delegate = self

        return label
    }()

    private lazy var password: UITextField = {[unowned self] in
        let label = UITextField()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
            label.widthAnchor.constraint(equalToConstant: 150).isActive = true

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: label.frame.height))
        label.leftView = paddingView
        label.leftViewMode = .always
        label.isSecureTextEntry = true
        label.placeholder = "Password"

        label.keyboardType = UIKeyboardType.default
        label.returnKeyType = UIReturnKeyType.done
        label.clearButtonMode = UITextField.ViewMode.whileEditing
        label.autocapitalizationType = .none

        label.delegate = self

        return label
    }()

    private lazy  var separatorView: UIView = {
        let separator = UIView()
        separator.backgroundColor = .lightGray
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        return separator
    }()


    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .systemGray6
        stackView.layer.cornerRadius = 10
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.distribution = .fill
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()




    private lazy var actionButton: UIButton = {
        let button  = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.alpha = 1.0
        button.setBackgroundImage(UIImage(named: "blue-pixel"), for: .normal)
        button.setTitle("Show Profile", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
      super.viewDidLoad()
        setupSelf()

  }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupKeyboardObservers()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        removeKeyboardObservers()
    }


    // MARK: - Actions


//    @objc func willShowKeyboard(_ notification: NSNotification) {
//        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
//        scrollView.contentInset.bottom += keyboardHeight ?? 0.0
//    }



    @objc private func keyboardDidShow(_ notification: NSNotification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }

        let keyboardHeight = keyboardFrame.cgRectValue.height
        scrollView.contentInset.bottom = keyboardHeight
    }

    @objc private func keyboardDidHide(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }


    // MARK: - Private


    private func setupSelf(){

      view.addSubview(scrollView)
        infoStackView.addArrangedSubview(login)
        infoStackView.addArrangedSubview(separatorView)
        infoStackView.addArrangedSubview(password)
        
        scrollView.addSubview(avatarImageView)
        scrollView.addSubview(actionButton)
        scrollView.addSubview(infoStackView)



        NSLayoutConstraint.activate([

            avatarImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            avatarImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor, multiplier: 1.0),

            actionButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            actionButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            actionButton.heightAnchor.constraint(equalToConstant: 50),
            actionButton.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 16),
            actionButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),

            infoStackView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 120),
            infoStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            infoStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            infoStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)

        ])


        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo:view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        actionButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        actionButton.layer.shadowColor = UIColor.black.cgColor
        actionButton.layer.shadowOpacity = 0.7
        actionButton.layer.shadowRadius = 4.0
    }


    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default

        notificationCenter.addObserver(
            self,
            selector: #selector(self.keyboardDidShow(_:)),
            name: UIResponder.keyboardDidShowNotification,
            object: nil
        )

        notificationCenter.addObserver(
            self,
            selector: #selector(self.keyboardDidHide(_:)),
            name: UIResponder.keyboardDidHideNotification,
            object: nil
        )
    }

    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }

    // MARK: - func button pressed



//    @objc func buttonPressed(_ sender: UIButton) {
//  #if DEBUG
//          let service = TestUserService()
//  #else
//          let service = CurrentUserService()
//  #endif
//          // Check user login
//        if let user = service.getUser(login: login.text ?? "", password:password.text  ?? "") {
//              let profileVC = ProfileViewController()
//            profileVC.currentUser = user
//              navigationController?.setViewControllers([profileVC], animated: true)
//          } else {
//              let alert = UIAlertController(title: "Unknown login", message: "Please, enter correct user login", preferredStyle: .alert)
//              alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
//              self.present(alert, animated: true)
//          }
//      }

    @objc private func buttonPressed(_ sender: UIButton) {
        guard let login = login.text else {return}
        guard let password = password.text else {return}
//Checker.shared.check(login: login, password: password)
        //loginDelegate?.check(login: login, password: password)
        let isValid = loginDelegate?.check(login: login, password: password)
        print("проверка логина:\(isValid)")
        if isValid == true {
            let service = CurrentUserService()
            let user = service.getUser()
            print(user)
            let profileVC = ProfileViewController()
            profileVC.currentUser = user
              navigationController?.pushViewController(profileVC, animated: true)

        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }


    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()

        return true
    }

    
}


extension LogInViewController:UserService {

    func getUser(login: String, password: String) -> User? {
        if let authenticatedUser = user.first(where: { $0.login == login }) {
            return authenticatedUser
        } else {
            return nil
        }
    }

    class CurrentUserService: UserService {
        let user: [User] = [
            User(login: "dummyuser", fullName: "User One", avatar: UIImage(named: "firstavatar") ?? UIImage(), status: "Online"),
            User(login: "user2", fullName: "User Two", avatar: UIImage(named: "secondavatar") ?? UIImage(), status: "Offline")
        ]

        func getUser() -> User? {
            if let authenticatedUser = user.first(where: { $0.login == "dummyuser"}) {
                return authenticatedUser
            } else {
                return nil
            }
        }
    }

    class TestUserService: UserService {
        var defaultTestUser = User(
            login: "usertest",
            fullName: "User Test",
            avatar: UIImage(named: "test") ?? UIImage(),
            status: "Test mode"
        )

        func getUser(login: String, password: String) -> User? {
            if login == defaultTestUser.login {
                return defaultTestUser
            } else {
                return nil
            }
        }
    }
}

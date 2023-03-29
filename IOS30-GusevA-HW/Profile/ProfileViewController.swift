import UIKit

class ProfileViewController: UIViewController {

    private lazy var setupNewButton: UIButton = {
        let button  = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemBlue
        button.setTitle("New Button", for: .normal)
        return button
    }()


    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.backgroundColor = .systemGray3
        return profileHeaderView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.profileHeaderView)
        view.backgroundColor = .systemGray3
        self.profileHeaderView.setup(name: "Personal Profile",description: "Waiting for something...",image: UIImage(named: "Image2"))
        self.view.addSubview(setupNewButton)

        NSLayoutConstraint.activate([
          self.profileHeaderView.topAnchor.constraint(equalTo:
               self.view.safeAreaLayoutGuide.topAnchor),
            self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
           self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

          self.setupNewButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
          self.setupNewButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
          self.setupNewButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)        ])

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(self.profileHeaderView.frame)
    }

}

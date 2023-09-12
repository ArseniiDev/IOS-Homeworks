import UIKit

class FeedViewController: UIViewController {

let post1 = Post(title: "Post 1")



    override func viewDidLoad() {
        super.viewDidLoad()

        let postButton = UIButton()
        postButton.translatesAutoresizingMaskIntoConstraints = false
        postButton.setTitle(post1.title, for: .normal)
    postButton.setTitleColor(.systemBlue, for: .normal)
#if DEBUG
        view.backgroundColor = .systemRed
        #else
        view.backgroundColor = .systemBlue
        #endif
        view.addSubview(postButton)

        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            postButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            postButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            postButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            postButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])

        postButton.addTarget(self, action: #selector(goToPostScreen(_:)), for: .touchUpInside)
    }

    @objc func goToPostScreen(_ sender: UIButton) {
        let nextScreen = PostViewController()
        nextScreen.title = post1.title
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}



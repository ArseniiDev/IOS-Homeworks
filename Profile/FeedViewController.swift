import UIKit
import SnapKit

class FeedViewController: UIViewController {

let post1 = Post(title: "Post 1")

    lazy var postButton: UIButton={
        let Button = UIButton()
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.setTitle(self.post1.title, for: .normal)
        Button.setTitleColor(.white, for: .normal)
        Button.addTarget(self, action: #selector(goToPostScreen(_:)), for: .touchUpInside)
        return Button
    }()

    private func setupView(){
        view.addSubview(postButton)
        postButton.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 79/255, alpha: 1)
        postButton.setBackgroundImage(UIImage(named: "blue-pixel"), for: .normal)
        postButton.layer.cornerRadius = 16

        postButton.layer.masksToBounds = true

        postButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(200)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

#if DEBUG
        view.backgroundColor = .systemGray5
        #else
        view.backgroundColor = .white
        #endif
        view.addSubview(postButton)

//        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
//        NSLayoutConstraint.activate([
//            postButton.leadingAnchor.constraint(
//                equalTo: safeAreaLayoutGuide.leadingAnchor,
//                constant: 20.0
//            ),
//            postButton.trailingAnchor.constraint(
//                equalTo: safeAreaLayoutGuide.trailingAnchor,
//                constant: -20.0
//            ),
//            postButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
//            postButton.heightAnchor.constraint(equalToConstant: 44.0)
//        ])

    }

    @objc func goToPostScreen(_ sender: UIButton) {
        let nextScreen = PostViewController()
        nextScreen.title = post1.title
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}



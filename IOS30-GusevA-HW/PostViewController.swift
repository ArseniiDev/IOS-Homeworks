import UIKit

class PostViewController: UIViewController {






    override func viewDidLoad() {
        super.viewDidLoad()
    let button = UIButton()

       button.setTitle("Back to main page", for: .normal)
       button.setTitleColor(.systemBlue, for: .normal)
       view.addSubview(button)
       button.frame.size = CGSize(width: 180.0, height: 50.0)
       button.center = self.view.center


        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(tabItemPressed(_:)))
        view.backgroundColor = .systemGray3
    }

    @objc func tabItemPressed(_ sender: UIButton) {
        let modalView = InfoViewController()

        modalView.modalTransitionStyle = .flipHorizontal // flipHorizontal
        modalView.modalPresentationStyle = .pageSheet // pageSheet

        present(modalView, animated: true)
    }

    @objc func buttonPressed(_ sender: UIButton){
        let nextScreen = FeedViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}

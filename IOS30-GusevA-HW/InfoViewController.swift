import UIKit

class InfoViewController: UIViewController {



    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton()
        view.addSubview(button)
        button.frame.size = CGSize(width: 180.0, height: 50.0)
        button.setTitle("Alert", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.center = self.view.center
        button.addTarget(self, action: #selector(alertButton(_:)), for: .touchUpInside)
        view.backgroundColor = .systemYellow
        title = "Example"
    }

    @objc func alertButton(_ sender: UIButton){
        let alertController = UIAlertController(title: "Message", message: "Message itself", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ok", style: .default, handler: {action in
            print("ok console")

        }))

        alertController.addAction(UIAlertAction(title: "cancel", style: .destructive, handler: {action in
            print("cancel console")

        }))
<<<<<<< HEAD

=======
        
>>>>>>> 81296c8ea866d71da25ffad22a8f9912de2ca80b
        present(alertController, animated: true)
    }

}

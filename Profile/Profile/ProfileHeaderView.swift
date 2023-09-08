//
//  ProfileHeaderView.swift
//  Profile1
//
//  Created by Arseniy Gusev on 7/22/23.
//

import UIKit
import SnapKit

class ProfileHeaderView: UIView {

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemYellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Image2")
        return imageView
    }()

    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello"
        return label
    }()


    private lazy var actionButton: UIButton = {
        let button  = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(actionButton(_:)), for: .touchUpInside)
        button.setTitle("Show status", for: .normal)

        return button
    }()


    private lazy var textField: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textfield.textColor = .gray
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.text = "type smth"
        return textfield
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews(){
        super.layoutSubviews()
        if let image = self.avatarImageView.image {
            let cornerRadius = min(self.avatarImageView.frame.width, self.avatarImageView.frame.height) / 2
            self.avatarImageView.layer.cornerRadius = cornerRadius
            self.avatarImageView.clipsToBounds = true
        }
    }


    //    func setup(name: String, description: String, image: UIImage? ){
    //        self.nameLabel.text = name
    //        self.descriptionLabel.text = description
    //        self.avatarImageView.image = image
    //
    //    }

    private func setupSelf(){
        self.addSubview(self.avatarImageView)
        self.addSubview(self.textField)
        self.addSubview(self.actionButton)
        self.addSubview(self.headerLabel)
        self.backgroundColor = .white

        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.snp.makeConstraints { make in
            make.leadingMargin.topMargin.equalTo(16)
            make.width.equalTo(100)
            make.height.equalTo(avatarImageView.snp.width)
        }

            textField.snp.makeConstraints { make in
                make.bottom.equalTo(actionButton.snp.top).offset(-34)
                make.leading.equalTo(avatarImageView.snp.trailing).offset(40)
            }

            actionButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
            actionButton.layer.shadowColor = UIColor.black.cgColor
            actionButton.layer.shadowOpacity = 0.7
            actionButton.layer.shadowRadius = 4.0
            actionButton.snp.makeConstraints { make in
                make.leading.equalTo(self).offset(16)
                   make.trailing.equalTo(self).offset(-16)
                   make.height.equalTo(50)
                   make.top.equalTo(avatarImageView.snp.bottom).offset(16)
                   make.bottom.equalTo(self)


            }

            headerLabel.snp.makeConstraints { make in
                make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(27)
                make.leading.equalTo(avatarImageView.snp.trailing).offset(40)
            }




// implementation with constrains STD

//        NSLayoutConstraint.activate([
//            self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
//            self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            self.avatarImageView.widthAnchor.constraint(equalToConstant: 100),
//            self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 1.0),
//
//            self.textField.bottomAnchor.constraint(equalTo: self.actionButton.topAnchor, constant: -34),
//            self.textField.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 40),
//
//            self.actionButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            self.actionButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
//            self.actionButton.heightAnchor.constraint(equalToConstant: 50),
//            self.actionButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16),
//            self.actionButton.bottomAnchor.constraint(equalTo: bottomAnchor),
//
//            self.headerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
//            self.headerLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 40)
//
//
//        ])
//
//        actionButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
//        actionButton.layer.shadowColor = UIColor.black.cgColor
//        actionButton.layer.shadowOpacity = 0.7
//        actionButton.layer.shadowRadius = 4.0
//
//        avatarImageView.layer.borderColor = UIColor.white.cgColor
//        avatarImageView.layer.borderWidth = 3



    }

    private var calculatedIntrinsicContentSize: CGSize = .zero

     override var intrinsicContentSize: CGSize {
         return calculatedIntrinsicContentSize
     }


    @objc func actionButton(_ sender: UIButton) {
        guard let text = textField.text else {
            print("Text is nil")
            return
        }
        print(text)

        let alertController = UIAlertController(title: "Text", message: text, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)

        //Get the current view controller and present the alert
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first(where: { $0.isKeyWindow }), let viewController = window.rootViewController {
            viewController.present(alertController, animated: true, completion: nil)
        }
    }

}

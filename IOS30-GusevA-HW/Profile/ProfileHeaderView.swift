//
//  ProfileHeaderView.swift
//  Profile
//
//  Created by Arseniy Gusev on 3/17/23.
//

import SwiftUI

class ProfileHeaderView: UIView {

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
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

    func setup(name: String, description: String, image: UIImage? = nil){
        self.headerLabel.text = name
        self.textField.text = description
        self.avatarImageView.image = image
        self.setNeedsLayout()
    }


    private func setupSelf(){
        self.addSubview(self.avatarImageView)
        self.addSubview(self.textField)
        self.addSubview(self.actionButton)
        self.addSubview(self.headerLabel)
        
        
        NSLayoutConstraint.activate([
            self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 1.0),
            
            self.textField.bottomAnchor.constraint(equalTo: self.actionButton.topAnchor, constant: -34),
            self.textField.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 40),
            
            self.actionButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.actionButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.actionButton.heightAnchor.constraint(equalToConstant: 50),
            self.actionButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16),
            
            self.headerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            self.headerLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 40)
            
            
        ])
        
        actionButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        actionButton.layer.shadowColor = UIColor.black.cgColor
        actionButton.layer.shadowOpacity = 0.7
        actionButton.layer.shadowRadius = 4.0

        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3

        

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

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first(where: { $0.isKeyWindow }), let viewController = window.rootViewController {
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    }



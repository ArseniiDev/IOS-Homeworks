//
//  TableViewCellCollectionPreset.swift
//  Gusev-IOSHW-3.4
//
//  Created by Arseniy Gusev on 9/19/23.
//

import UIKit

class TableViewCellCollectionPreset: UITableViewCell {

    var navigationController: UINavigationController?
    var stackView: UIStackView!
    var imageNames: [String] = ["CollectionView1", "CollectionView2", "CollectionView3", "CollectionView4"]

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStackView()
        setupSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var HeaderLabel: UILabel = {
        let header = UILabel()
        header.textColor = .black
        header.text = "Photos"
        header.font = UIFont.boldSystemFont(ofSize: 20)
        header.numberOfLines = 0
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()

    func setupStackView() {
        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8 // Adjust the spacing as needed
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupSelf() {
        self.addSubview(self.HeaderLabel)

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])

        for imageName in imageNames {
            let imageView = UIImageView()
            imageView.image = UIImage(named: imageName)
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.0).isActive = true
            stackView.addArrangedSubview(imageView)

            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGestureRecognizer)
        }
    }

//    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
//        print("Image tapped")
//        let photosViewController = PhotosViewController()
//        navigationController?.pushViewController(photosViewController, animated: true)
//    }

    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        print("Image tapped")
        NotificationCenter.default.post(name: .imageTappedNotification, object: nil)
    }

}


extension Notification.Name {
    static let imageTappedNotification = Notification.Name("ImageTapped")
}

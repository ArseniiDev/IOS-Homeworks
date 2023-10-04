//
//  PhotosTableViewCell.swift
//  Gusev-IOSHW-3.4
//
//  Created by Arseniy Gusev on 9/18/23.
//

import UIKit

class PhotosTableViewCell: UICollectionViewCell {

    static let identifier = "PhotosTableViewCell"

    private let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .white
        iv.clipsToBounds = true
        return iv
    }()

    public func configure(image:UIImage){
        self.myImageView.image = image
        self.setupUI()
    }

    private func setupUI(){
        self.backgroundColor = .systemRed
        self.addSubview(myImageView)
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: self.topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.myImageView.image = nil
    }

}

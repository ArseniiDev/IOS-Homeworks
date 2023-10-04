//
//  PhotosViewController.swift
//  Gusev-IOSHW-3.4
//
//  Created by Arseniy Gusev on 9/18/23.
//

import UIKit

class PhotosViewController: UIViewController {

    private var images: [UIImage] = []

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame:.zero, collectionViewLayout: layout)
        collectionView.register(PhotosTableViewCell.self, forCellWithReuseIdentifier: PhotosTableViewCell.identifier)
        collectionView.alwaysBounceVertical = true
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
            self.collectionView.dataSource = self
            self.collectionView.delegate = self


        images.append(UIImage(named: "CollectionView1")!)
        images.append(UIImage(named: "CollectionView2")!)
        images.append(UIImage(named: "CollectionView3")!)
        images.append(UIImage(named: "CollectionView4")!)
        images.append(UIImage(named: "CollectionView5")!)
        images.append(UIImage(named: "CollectionView6")!)
        images.append(UIImage(named: "CollectionView7")!)
        images.append(UIImage(named: "CollectionView8")!)
        images.append(UIImage(named: "CollectionView9")!)
        images.append(UIImage(named: "CollectionView10")!)
        images.append(UIImage(named: "CollectionView11")!)
        images.append(UIImage(named: "CollectionView12")!)
        images.append(UIImage(named: "CollectionView13")!)
        images.append(UIImage(named: "CollectionView14")!)
        images.append(UIImage(named: "CollectionView15")!)
        images.append(UIImage(named: "CollectionView16")!)
        images.append(UIImage(named: "CollectionView17")!)
        images.append(UIImage(named: "CollectionView18")!)

        }

         func setupUI() {
            self.view.backgroundColor = .systemBlue

            self.view.addSubview(collectionView)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            ])
        }


}


extension PhotosViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
// count images
        return self.images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosTableViewCell.identifier, for: indexPath) as? PhotosTableViewCell else {
            fatalError("fail to dequeue Customcell in Viewcontroller")
        }

        // reuse cells

        let image = self.images[indexPath.row]
        cell.configure(image: image)

        return cell
    }
}




extension PhotosViewController: UICollectionViewDelegateFlowLayout{

    // setup view

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (self.view.frame.width/3) - 1.34
        return CGSize(width: size, height: size)
    }

    // Vertical Spacing

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}

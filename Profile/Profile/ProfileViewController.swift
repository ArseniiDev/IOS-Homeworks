//
//  ProfileHeaderView.swift
//  Profile
//
//  Created by Arseniy Gusev on 3/17/23.
//

import UIKit

class ProfileViewController: UIViewController {

    var currentUser: User?

    private enum CellReuseID: String {
        case base = "PostTableViewCell_ReuseID"
        case custom = "TableViewCellCollectionPreset_ReuseID"
    }

    
    // MARK: - viewDidLoad()

    override func viewDidLoad() {
        super.viewDidLoad()
        //test if user was saved
        print(currentUser?.login)
        setupSelf()
        view.backgroundColor = .systemGray3
        NotificationCenter.default.addObserver(self, selector: #selector(handleImageTap), name: .imageTappedNotification, object: nil)
    }

    @objc func handleImageTap() {
            let photosViewController = PhotosViewController()
            navigationController?.pushViewController(photosViewController, animated: true)
        }


    struct Cells {
        static let videoCell = "VideoCell"
    }



    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: Cells.videoCell)
        tableView.register(TableViewCellCollectionPreset.self, forCellReuseIdentifier: CellReuseID.custom.rawValue)
        return tableView
    }()





    struct Images {
        static let first = UIImage(named: "img1")!
        static let secound = UIImage(named: "img2")!
        static let third = UIImage(named: "img3")!
        static let forth = UIImage(named: "img4")!
        static let fifth = UIImage(named: "img5")!

    }

    // MARK: - Adding tableView

    private func setupSelf() {

        view.addSubview(tableView)

        NSLayoutConstraint.activate([

            self.tableView.topAnchor.constraint(equalTo: view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: view.self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: view.self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.self.bottomAnchor)
        ])


    }


}


// MARK: - Extension for TableView

extension ProfileViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
           return 1 // You have only one section
       }

       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return videos.count + 1 // Add 1 for the custom cell in the first row
       }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            // This is the first row, use the second cell type
            let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID.custom.rawValue, for: indexPath) as! TableViewCellCollectionPreset
            // Configure your second cell here
            return cell
        } else {
            // All other rows use the first cell type
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell, for: indexPath) as! PostTableViewCell

            let video = videos[indexPath.row - 1] // Subtract 1 to account for the first row
            cell.set(video: video)

            return cell
        }
    }


    // MARK: - User Avatar/Name/Status Setup as well as headerView

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
                    let headerView = ProfileHeaderView()
                    if let currentUser = currentUser {
                        headerView.setup(name: currentUser.fullName, description: currentUser.status, image: currentUser.avatar)
                    }
                    return headerView
                }
                return nil
       }

}

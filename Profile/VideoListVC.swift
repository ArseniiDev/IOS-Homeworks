//
//  VideoListVC.swift
//  Profile
//
//  Created by Arseniy Gusev on 6/11/23.
//

//import UIKit
//
//class VideoListVC: UIViewController {
//
//    var tableView = UITableView()
//    var videos: [Video] = []
//
//    struct Cells {
//        static let videoCell = "VideoCell"
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Nav title"
//        videos = fetchData()
//        configureTableView()
//    }
//
//    func configureTableView() {
//        view.addSubview(tableView)
//
//        //set delegates
//
//        setTableViewDelegates()
//
//        //implementation
//        func setTableViewDelegates(){
//            tableView.delegate = self
//            tableView.dataSource = self
//        }
//
//
//
//
//        //set row height
//        tableView.rowHeight = 100
//
//
//        //register cells
//        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
//
//
//        //set constraints
//        tableView.pin(to: view)
//
//    }
//
//}
//
//extension VideoListVC: UITableViewDelegate,UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return videos.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell
//
//        let video = videos[indexPath.row]
//        cell.set(video: video)
//
//        return cell
//    }
//
//
//}
//
//
//extension VideoListVC {
//
//    func fetchData() -> [Video] {
//        let video1 = Video(image: Images.first, title: "Very first image")
//        let video2 = Video(image: Images.secound, title: "Second image")
//        let video3 = Video(image: Images.third, title: "middle image")
//        let video4 = Video(image: Images.forth, title: "forth image")
//        let video5 = Video(image: Images.fifth, title: "Very last image")
//
//        return[video1,video2,video3,video4,video5]
//    }
//
//}


//
//  VideoCell.swift
//  Profile
//
//  Created by Arseniy Gusev on 6/11/23.
//

//import UIKit
//
//class VideoCell: UITableViewCell {
//
//var videoImageView = UIImageView()
//    var videoTilteLabel = UILabel()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addSubview(videoImageView)
//        addSubview(videoTilteLabel)
//
//
//        configuretitleLabel()
//        configureImageView()
//        setImageConstraints()
//        setTitleLabelConstraints()
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func set(video:Video){
//        videoImageView.image = video.image
//        videoTilteLabel.text = video.title
//    }
//
//    func configureImageView(){
//        videoImageView.layer.cornerRadius = 10
//        videoImageView.clipsToBounds = true
//    }
//
//    func configuretitleLabel(){
//        videoTilteLabel.numberOfLines = 0
//        videoTilteLabel.adjustsFontSizeToFitWidth = true
//    }
//
//
//    func setImageConstraints(){
//
//        videoImageView.translatesAutoresizingMaskIntoConstraints = false
//        videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
//        videoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 16/9).isActive = true
//    }
//
//
//    func setTitleLabelConstraints(){
//        videoTilteLabel.translatesAutoresizingMaskIntoConstraints = false
//        videoTilteLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        videoTilteLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 20).isActive = true
//        videoTilteLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        videoTilteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true    }
//
//}

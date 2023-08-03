//
//  ProfileTableHederView.swift
//  Profile
//
//  Created by Arseniy Gusev on 7/6/23.
//
import StorageService
import UIKit


class PostTableViewCell: UITableViewCell {


    var videoHeaderLabel:UILabel = {
        let header = UILabel()
        header.textColor = .black
        header.font = UIFont.boldSystemFont(ofSize: 20)
        header.numberOfLines = 0
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
var videoImageView = UIImageView()
    var videoTilteLabel:UILabel={
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textColor = .systemGray
        text.numberOfLines = 0
        return text
    }()
    
    var videoLikesLabel:UILabel = {
let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
       label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    var videoViewsLabel:UILabel = {
        let label = UILabel()
                label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
               label.textColor = .black
                label.numberOfLines = 0
                return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(videoHeaderLabel)
        addSubview(videoImageView)
        addSubview(videoTilteLabel)
        addSubview(videoLikesLabel)
        addSubview(videoViewsLabel)


        configuretitleLabel()
        //configureImageView()
        setImageConstraints()
        setTitleLabelConstraints()
        confLabels()
       setLabelsConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(video:Video){
        videoHeaderLabel.text = video.header
        videoImageView.image = video.image
        videoTilteLabel.text = video.title
        videoLikesLabel.text = String(Int(video.likes))
        videoViewsLabel.text = String(Int(video.views))
    }

    func configureImageView(){
        videoImageView.clipsToBounds = true
    }

    func configuretitleLabel(){
        videoTilteLabel.numberOfLines = 0
        videoTilteLabel.adjustsFontSizeToFitWidth = true
    }

    func confLabels(){
        videoHeaderLabel.numberOfLines = 0
        videoLikesLabel.numberOfLines = 0
        videoViewsLabel.numberOfLines = 0

    }

    func setLabelsConstraints() {
        videoLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        videoViewsLabel.translatesAutoresizingMaskIntoConstraints = false
        videoHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        videoLikesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        videoViewsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        videoLikesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        videoViewsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        videoHeaderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        videoHeaderLabel.bottomAnchor.constraint(equalTo: videoImageView.topAnchor, constant: -12).isActive = true



    }

    func setImageConstraints() {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false

        videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        videoImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        videoImageView.topAnchor.constraint(equalTo: videoHeaderLabel.bottomAnchor, constant: 12).isActive = true
        videoImageView.bottomAnchor.constraint(equalTo: videoTilteLabel.topAnchor, constant: -10).isActive = true

        videoImageView.contentMode = .scaleAspectFit
        videoImageView.clipsToBounds = true
        videoImageView.backgroundColor = .black 

        let aspectRatioConstraint = videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 1.0)
        aspectRatioConstraint.priority = .defaultHigh
        aspectRatioConstraint.isActive = true
    }

    func setTitleLabelConstraints() {
        videoTilteLabel.translatesAutoresizingMaskIntoConstraints = false
       videoTilteLabel.bottomAnchor.constraint(equalTo: videoLikesLabel.topAnchor, constant: -15).isActive = true
        videoTilteLabel.bottomAnchor.constraint(equalTo: videoViewsLabel.topAnchor, constant: -15).isActive = true
        videoTilteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        videoTilteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true

    }

}

//
//  Post.swift
//  Profile
//
//  Created by Arseniy Gusev on 3/17/23.
//

import Foundation
import UIKit


public var videos: [Video] = [Video(header:"Header 1",image:UIImage(named: "img5"),title:"Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.",likes: 240,views: 700),Video(header:"Header 2",image:UIImage(named: "img3"),title:"Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.",likes: 248,views: 700),Video(header:"Header 3",image:UIImage(named: "img2"),title:"Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.",likes: 245,views: 750),Video(header:"Header 4",image:UIImage(named: "img1"),title:"Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.",likes: 244,views: 700),Video(header:"Header 5",image:UIImage(named: "img2"),title:"Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.",likes: 243,views: 708),Video(header:"Header 6",image:UIImage(named: "img3"),title:"Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.",likes: 240,views: 700),Video(header:"Header 7",image:UIImage(named: "img4"),title:"Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.",likes: 240,views: 780),Video(header:"Header 8",image:UIImage(named: "img5"),title:"Very first image",likes: 240,views: 700)]

public struct Video {
    public var header: String
    public var image: UIImage?
    public var title: String
    public var likes: Int
    public var views: Int

    public init(header: String, image: UIImage?, title: String, likes: Int, views: Int) {
        self.header = header
        self.image = image
        self.title = title
        self.likes = likes
        self.views = views
    }
}


public struct Post {
    public var title: String
    
    public init(title: String) {
        self.title = title
    }
}

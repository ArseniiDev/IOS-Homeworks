//
//  Post.swift
//  Profile
//
//  Created by Arseniy Gusev on 3/17/23.
//

import Foundation
import UIKit


var videos: [Video] = [Video(header:"Header 1",image:UIImage(named: "img5"),title:"Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.",likes: 240,views: 700),Video(header:"Header 2",image:UIImage(named: "img3"),title:"Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.",likes: 248,views: 700),Video(header:"Header 3",image:UIImage(named: "img2"),title:"Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.",likes: 245,views: 750),Video(header:"Header 4",image:UIImage(named: "img1"),title:"Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.",likes: 244,views: 700),Video(header:"Header 5",image:UIImage(named: "img2"),title:"Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.",likes: 243,views: 708),Video(header:"Header 6",image:UIImage(named: "img3"),title:"Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.",likes: 240,views: 700),Video(header:"Header 7",image:UIImage(named: "img4"),title:"Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.Verify the parent view's constraints: Check the constraints of the superview that contains both the image view and the label. Ensure that the superview's constraints allow for the desired vertical positioning of the elements.",likes: 240,views: 780),Video(header:"Header 8",image:UIImage(named: "img5"),title:"Very first image",likes: 240,views: 700)]

struct Video{
    var header:String
    var image: UIImage?
    var title: String
    var likes: Int
    var views: Int
}


struct Post{
    var title:String
}

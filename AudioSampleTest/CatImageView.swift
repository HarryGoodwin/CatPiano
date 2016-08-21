//
//  CatImage.swift
//  AudioSampleTest
//
//  Created by Harry Goodwin on 09/08/2016.
//  Copyright © 2016 Harry Goodwin. All rights reserved.
//

import UIKit

class CatImageView: UIImageView {

	func addBouncing(){
		UIView.animateWithDuration(0.5, delay:0, options: [.Repeat, .Autoreverse], animations: {
			
			self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y + 20, width: self.frame.size.width, height: self.frame.size.height)
			
//			var degrees: CGFloat = CGFloat(arc4random_uniform(20))
//			degrees -= 15
//			self.transform = CGAffineTransformMakeRotation(degrees * CGFloat(M_PI/180));
			
			}, completion: nil)
	}
	
	func stopBouncing(){
		self.layer.removeAllAnimations()
	}
}

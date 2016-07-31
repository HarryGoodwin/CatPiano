//
//  CatsView.swift
//  AudioSampleTest
//
//  Created by Harry Goodwin on 31/07/2016.
//  Copyright © 2016 Harry Goodwin. All rights reserved.
//

import UIKit

@IBDesignable

class CatsView: UIView {

	func addCats(){
		var xPosition: CGFloat = -30
		
		while xPosition < frame.size.width {
			let randomCatIndex: Int = Int(arc4random_uniform(3) + 1);
			let imageString = "Catcordion_Cat\(randomCatIndex)_idle"
			let image = UIImage(named: imageString)
			let yPosition: CGFloat = bounds.size.height - (image?.size.height)! - 115
			let imageView = UIImageView(frame: CGRect(x: xPosition, y: yPosition, width: (image?.size.width)!, height: (image?.size.height)!))
			imageView.image = image
			imageView.addBouncing()
			addSubview(imageView)
			
			xPosition += imageView.frame.size.width
			debugPrint("Ending loop: x = \(xPosition), frame = \(frame.size.width)")
		}
		
		xPosition = 30
		while xPosition < frame.size.width {
			let randomCatIndex: Int = Int(arc4random_uniform(3) + 1);
			let imageString = "Catcordion_Cat\(randomCatIndex)_idle"
			let image = UIImage(named: imageString)
			let yPosition: CGFloat = bounds.size.height - (image?.size.height)! - 90
			let imageView = UIImageView(frame: CGRect(x: xPosition, y: yPosition, width: (image?.size.width)!, height: (image?.size.height)!))
			imageView.image = image
			imageView.addBouncing()
			addSubview(imageView)
			
			xPosition += imageView.frame.size.width
			debugPrint("Ending loop: x = \(xPosition), frame = \(frame.size.width)")
		}
	}
}

extension UIImageView {
	func addBouncing(){
		UIView.animateWithDuration(0.5, delay:0, options: [.Repeat, .Autoreverse], animations: {
			
			self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y + 20, width: self.frame.size.width, height: self.frame.size.height)
			
			var degrees: CGFloat = CGFloat(arc4random_uniform(20))
			degrees -= 15
			self.transform = CGAffineTransformMakeRotation(degrees * CGFloat(M_PI/180));
			
			}, completion: nil)
	}
}

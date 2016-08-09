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
	
	var catImages:[CatImage] = []

	func addCats(){
		var xPosition: CGFloat = -30
		
		while xPosition < frame.size.width {
			let randomCatIndex: Int = Int(arc4random_uniform(3) + 1);
			let imageString = "Catcordion_Cat\(randomCatIndex)_idle"
			let image = UIImage(named: imageString)
			let yPosition: CGFloat = bounds.size.height - (image?.size.height)! - 115
			let imageView = CatImage(frame: CGRect(x: xPosition, y: yPosition, width: (image?.size.width)!, height: (image?.size.height)!))
			imageView.image = image
			catImages.append(imageView)
			addSubview(imageView)
			
			xPosition += imageView.frame.size.width
		}
		
		xPosition = 30
		while xPosition < frame.size.width {
			let randomCatIndex: Int = Int(arc4random_uniform(3) + 1);
			let imageString = "Catcordion_Cat\(randomCatIndex)_idle"
			let image = UIImage(named: imageString)
			let yPosition: CGFloat = bounds.size.height - (image?.size.height)! - 90
			let imageView = CatImage(frame: CGRect(x: xPosition, y: yPosition, width: (image?.size.width)!, height: (image?.size.height)!))
			imageView.image = image
			catImages.append(imageView)
			addSubview(imageView)
			
			xPosition += imageView.frame.size.width
		}
	}
	
	func startCatDance(){
		catImages.forEach({$0.addBouncing()})
	}
	
	func stopCatDance(){
		catImages.forEach({$0.stopBouncing()})
	}
}


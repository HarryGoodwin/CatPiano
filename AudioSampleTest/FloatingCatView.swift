//
//  FloatingCatView.swift
//  AudioSampleTest
//
//  Created by Harry Goodwin on 10/08/2016.
//  Copyright © 2016 Harry Goodwin. All rights reserved.
//

import UIKit

class FloatingCatView: UIView {
	
	@IBOutlet weak var floatingCat1Constraint:NSLayoutConstraint?
	@IBOutlet weak var floatingCat2Constraint:NSLayoutConstraint?
	
	func animateFloatingCats(){
		UIView.animateWithDuration(30, delay: 0, options: [.Autoreverse, .Repeat], animations: {
			self.floatingCat1Constraint?.constant = self.bounds.size.width
			self.floatingCat2Constraint?.constant = self.bounds.size.width
			self.layoutIfNeeded()
			}, completion: nil)
	}
	
	func resetConstraints(){
		self.floatingCat1Constraint?.constant = 0
		self.floatingCat2Constraint?.constant = 0
		self.layoutIfNeeded()
	}
}

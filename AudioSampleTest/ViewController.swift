//
//  ViewController.swift
//  AudioSampleTest
//
//  Created by Harry Goodwin on 19/07/2016.
//  Copyright © 2016 Harry Goodwin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

	@IBOutlet weak var floatingCatsView: FloatingCatView!
    @IBOutlet weak var pianoView: PianoView!
	@IBOutlet weak var drumsButton: UIButton!

	@IBOutlet weak var salemTralingConstraint: NSLayoutConstraint!
	
	@IBOutlet weak var firstBorderView: UIView!
	@IBOutlet weak var secondBorderView: UIView!
	@IBOutlet weak var thirdBorderView: UIView!
	@IBOutlet weak var fourthBorderView: UIView!
	@IBOutlet weak var fifthBorderView: UIView!
	@IBOutlet weak var sixthBorderView: UIView!

    let notePlayer = NotePlayer()
	var rainbowTimer:NSTimer?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		loadPianoView()
		notePlayer.initialiseAudioPLayers()
		floatingCatsView.animateFloatingCats()
		startRainbowAnimation()
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ViewController.viewEnteredForeground), name:
			UIApplicationWillEnterForegroundNotification, object: nil)
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ViewController.viewLeavingForeground), name:
			UIApplicationWillResignActiveNotification, object: nil)
	}
	
	func startRainbowAnimation(){
		rainbowTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.cycleRainbowColours), userInfo: nil, repeats: true)
	}
	
	func stopRainbowAnimation(){
		rainbowTimer?.invalidate()
	}
	
	func cycleRainbowColours()
	{
		let originalColour = firstBorderView.backgroundColor
		firstBorderView.backgroundColor = secondBorderView.backgroundColor
		secondBorderView.backgroundColor = thirdBorderView.backgroundColor
		thirdBorderView.backgroundColor = fourthBorderView.backgroundColor
		fourthBorderView.backgroundColor = fifthBorderView.backgroundColor
		fifthBorderView.backgroundColor = sixthBorderView.backgroundColor
		sixthBorderView.backgroundColor = originalColour
	}
    
	func viewEnteredForeground(){
		floatingCatsView.animateFloatingCats()
	}
	
	func viewLeavingForeground(){
		floatingCatsView.resetConstraints()
	}
    
    func loadPianoView(){
        let xibView = NSBundle.mainBundle().loadNibNamed("PianoView", owner: self, options: nil)[0] as! PianoView
        xibView.frame = pianoView.bounds
        pianoView.addSubview(xibView)
        xibView.delegate = self
    }
	
	@IBAction func drumsButtonPressed(sender: AnyObject) {
		if notePlayer.drumsPlaying(){
			notePlayer.stopDrums()
			drumsButton.setBackgroundImage(UIImage(named: "BassDrum"), forState: .Normal)
			self.salemTralingConstraint.constant = -360
		}else{
			notePlayer.playDrums()
			drumsButton.setBackgroundImage(UIImage(named: "BassDrumFilled"), forState: .Normal)
			UIView.animateWithDuration(2.5, animations: {
				self.salemTralingConstraint.constant = 800
				self.view.layoutIfNeeded()
			})
		}
	}
	
	@IBAction func cat1Pressed(sender: AnyObject) {
		print("Cat1 Pressed")
	}
	
	@IBAction func cat2Pressed(sender: AnyObject) {
		print("Cat2 Pressed")
	}
	
	@IBAction func cat3Pressed(sender: AnyObject) {
		print("Cat3 Pressed")
	}
	
	@IBAction func cat4Pressed(sender: AnyObject) {
		print("Cat4 Pressed")
	}
	
	@IBAction func cat5Pressed(sender: AnyObject) {
		print("Cat5 Pressed")
	}
	
	@IBAction func cat6Pressed(sender: AnyObject) {
		print("Cat6 Pressed")
	}
}

extension ViewController: PianoViewDelegate{
    func keyPressed(note: String) {
        notePlayer.playNote(note)
    }
}


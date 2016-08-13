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

    let notePlayer = NotePlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPianoView()
        notePlayer.initialiseAudioPLayers()
		floatingCatsView.animateFloatingCats()
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ViewController.viewEnteredForeground), name:
			UIApplicationWillEnterForegroundNotification, object: nil)
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ViewController.viewLeavingForeground), name:
			UIApplicationWillResignActiveNotification, object: nil)
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
			self.salemTralingConstraint.constant = -360
		}else{
			notePlayer.playDrums()
			UIView.animateWithDuration(2.5, animations: {
				self.salemTralingConstraint.constant = 800
				self.view.layoutIfNeeded()
			})
		}
	}
}

extension ViewController: PianoViewDelegate{
    func keyPressed(note: String) {
        notePlayer.playNote(note)
    }
}


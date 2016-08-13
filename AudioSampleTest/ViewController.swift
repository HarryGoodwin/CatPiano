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
    }
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		floatingCatsView.animateFloatingCats()
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
			//	catView.stopCatDance()
		}else{
			notePlayer.playDrums()
			UIView.animateWithDuration(2.5, animations: {
				self.salemTralingConstraint.constant = 700
				self.view.layoutIfNeeded()
			})
			//catView.startCatDance()
		}
	}
}

extension ViewController: PianoViewDelegate{
    func keyPressed(note: String) {
        notePlayer.playNote(note)
    }
}


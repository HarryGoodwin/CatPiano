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

	@IBOutlet weak var bassPianoView: PianoView!
    @IBOutlet weak var pianoView: PianoView!
	@IBOutlet weak var catView: CatsView!
    
    let notePlayer = NotePlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPianoView()
		catView.addCats()
        notePlayer.initialiseAudioPLayers()
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.rotated), name: UIDeviceOrientationDidChangeNotification, object: nil)
    }
    
    func loadPianoView(){
        let xibView = NSBundle.mainBundle().loadNibNamed("PianoView", owner: self, options: nil)[0] as! PianoView
        xibView.frame = pianoView.bounds
        xibView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        pianoView.addSubview(xibView)
        xibView.delegate = self
		
		let xibView2 = NSBundle.mainBundle().loadNibNamed("PianoView", owner: self, options: nil)[0] as! PianoView
		xibView2.frame = bassPianoView.bounds
		xibView2.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
		bassPianoView.addSubview(xibView2)
		xibView2.delegate = self
    }
	
	func rotated(){
		UIView.animateWithDuration(0.5, animations: {
			self.bassPianoView.hidden = UIDeviceOrientationIsPortrait(UIDevice.currentDevice().orientation)
		})
	}
}

extension ViewController: PianoViewDelegate{
    func keyPressed(note: String) {
        notePlayer.playNote(note)
    }
}


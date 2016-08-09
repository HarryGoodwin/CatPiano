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

    @IBOutlet weak var pianoView: PianoView!
	@IBOutlet weak var catView: CatsView!
	@IBOutlet weak var drumsButton: UIButton!
    
    let notePlayer = NotePlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPianoView()
		catView.addCats()
        notePlayer.initialiseAudioPLayers()
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
			catView.stopCatDance()
		}else{
			notePlayer.playDrums()
			catView.startCatDance()
		}
	}
}

extension ViewController: PianoViewDelegate{
    func keyPressed(note: String) {
        notePlayer.playNote(note)
    }
}


//
//  NotePlayer.swift
//  AudioSampleTest
//
//  Created by Harry Goodwin on 22/07/2016.
//  Copyright © 2016 Harry Goodwin. All rights reserved.
//

import UIKit
import AVFoundation

class NotePlayer: NSObject {

    var audioNotes:[String : AVAudioPlayer] = [:]
	var drumPlayer: AVAudioPlayer?

    func initialiseAudioPLayers(){
        Notes.all().forEach({(note: String) in
            if let noteFilePath = NSBundle.mainBundle().pathForResource("Medium_Meow_\(note)", ofType: "mp3"){
                let noteURL = NSURL(fileURLWithPath: noteFilePath)
                do {
                    let ap = try AVAudioPlayer.init(contentsOfURL: noteURL)
                    audioNotes[note] = ap
                }catch{
                    debugPrint("AVAudio error - note\(note)")
                }
            }
        })
    }
    
    func playNote(note: String) {
        if let notePLayer = audioNotes[note]{
            if notePLayer.playing{
                notePLayer.currentTime = 0
            }
            
            notePLayer.play()
        }
    }
	
	func playDrums(){
		if (drumPlayer == nil){
			if let noteFilePath = NSBundle.mainBundle().pathForResource("testBeat", ofType: "mp3"){
				let noteURL = NSURL(fileURLWithPath: noteFilePath)
				do {
					drumPlayer = try AVAudioPlayer.init(contentsOfURL: noteURL)
				}catch{
					debugPrint("AVAudio error - drumPLayer")
				}
			}
		}
		
		drumPlayer?.currentTime = 0
		drumPlayer?.play()
	}
	
	func stopDrums(){
		drumPlayer?.stop()
	}
	
	func drumsPlaying() -> Bool{
		if drumPlayer != nil{
			return (drumPlayer?.playing)!
		}
		
		return false
	}
}

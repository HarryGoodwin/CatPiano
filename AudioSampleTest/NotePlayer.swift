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
            debugPrint("Playing Note \(note)")
        }
    }
}

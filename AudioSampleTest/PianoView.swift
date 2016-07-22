//
//  PianoView.swift
//  AudioSampleTest
//
//  Created by Harry Goodwin on 20/07/2016.
//  Copyright © 2016 Harry Goodwin. All rights reserved.
//

import UIKit

protocol PianoViewDelegate: class {
    func keyPressed(note: String)
}

class PianoView: UIView {

    var delegate: PianoViewDelegate?

    @IBAction func keyCPressed(sender: AnyObject) {
        delegate?.keyPressed(Notes.c)
    }

    @IBAction func keyCsPressed(sender: AnyObject) {
        delegate?.keyPressed(Notes.cSharp)
    }
    
    @IBAction func keyDPressed(sender: AnyObject) {
        delegate?.keyPressed(Notes.d)
    }
    
    @IBAction func keyDsPressed(sender: AnyObject) {
        delegate?.keyPressed(Notes.dSharp)
    }
    
    @IBAction func keyEPressed(sender: AnyObject) {
        delegate?.keyPressed(Notes.e)
    }

    @IBAction func keyFPressed(sender: AnyObject) {
        delegate?.keyPressed(Notes.f)
    }
    
    @IBAction func keyFsPressed(sender: AnyObject) {
        delegate?.keyPressed(Notes.fSharp)
    }
    
    @IBAction func keyGPressed(sender: AnyObject) {
        delegate?.keyPressed(Notes.g)
    }
    
    @IBAction func keyGsPressed(sender: AnyObject) {
        delegate?.keyPressed(Notes.gSharp)
    }
    
    @IBAction func keyAPressed(sender: AnyObject) {
        delegate?.keyPressed(Notes.a)
    }
    
    @IBAction func keyAsPressed(sender: AnyObject) {
        delegate?.keyPressed(Notes.aSharp)
    }
    
    @IBAction func keyBPressed(sender: AnyObject) {
        delegate?.keyPressed(Notes.b)
    }
}

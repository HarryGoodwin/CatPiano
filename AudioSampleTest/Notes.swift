//
//  Notes.swift
//  AudioSampleTest
//
//  Created by Harry Goodwin on 22/07/2016.
//  Copyright © 2016 Harry Goodwin. All rights reserved.
//

import UIKit

class Notes {

    static let c = "C"
    static let cSharp = "C#"
    static let d = "D"
    static let dSharp = "D#"
    static let e = "E"
    static let f = "F"
    static let fSharp = "F#"
    static let g = "G"
    static let gSharp = "G#"
    static let a = "A"
    static let aSharp = "A#"
    static let b = "B"
    
    class func all() -> [String]{
        return [c, cSharp, d, dSharp, e, f, fSharp, g, gSharp, a, aSharp, b]
    }
}

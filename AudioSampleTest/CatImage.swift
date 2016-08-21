//
//  CatImage.swift
//  Meowsic
//
//  Created by Harry Goodwin on 18/08/2016.
//  Copyright © 2016 Harry Goodwin. All rights reserved.
//

import UIKit
import CoreImage

class CatImage: UIImage {

	func getEyePositions(){
		let ciImage = UIKit.CIImage(CGImage: CGImage!)
		
		let options = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
		let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: options)
		
		let faces = faceDetector.featuresInImage(ciImage)
		
		if let face = faces.first as? CIFaceFeature {
			print("Found face at \(face.bounds)")
			
			if face.hasLeftEyePosition {
				print("Found left eye at \(face.leftEyePosition)")
			}
			
			if face.hasRightEyePosition {
				print("Found right eye at \(face.rightEyePosition)")
			}
			
			if face.hasMouthPosition {
				print("Found mouth at \(face.mouthPosition)")
			}
		}
		else{
			print("No Luck!!")
		}
	}
}

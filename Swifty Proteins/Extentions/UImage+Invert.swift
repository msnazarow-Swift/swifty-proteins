//
//  UImage+Invert.swift
//  Swifty Proteins
//
//  Created by 19733654 on 09.01.2022.
//

import Foundation
import UIKit

extension UIImage {
	func invertedColors() -> UIImage? {
		guard
			let filter = CIFilter(name: "CIColorInvert"),
			let cgImage = cgImage
		else { return nil }
		let img = CIImage(cgImage: cgImage)
		filter.setDefaults()
		filter.setValue(img, forKey: "inputImage")
		let context = CIContext()
		if
			let image = filter.outputImage,
			let cgimg = context.createCGImage(image, from: image.extent) {
			return UIImage(cgImage: cgimg)
		}
		return nil
	}
}

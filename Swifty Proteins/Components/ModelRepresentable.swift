//
//  ModelRepresentable.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//  
//

import UIKit

protocol ModelRepresentable {
    var model: ModelIdentifiable? { get set }
}

protocol ModelIdentifiable {
    var identifier: String { get }
}

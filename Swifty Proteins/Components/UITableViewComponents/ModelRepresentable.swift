//
//  ModelRepresentable.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//  
//

import UIKit

protocol ModelRepresentable {
    var model: Identifiable? { get set }
}

protocol Identifiable {
    var identifier: String { get }
}

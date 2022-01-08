//
//  SCNVector3+Ext.swift
//  Swifty Proteins
//
//  Created by Clothor- on 1/8/22.
//

import SceneKit

extension SCNVector3: Equatable {
    public static func == (lhs: SCNVector3, rhs: SCNVector3) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
    }
}

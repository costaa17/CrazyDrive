//
//  Sample.swift
//  CrazyDrive
//
//  Created by Ana Vitoria do Valle Costa on 5/30/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
class Sample: Shape {
    init(type: Int) {
        super.init(type: type, shapeC: GROUND_COLOR)
        self.physicsBody?.categoryBitMask = SAMPLES_CATEGORY
        self.physicsBody?.contactTestBitMask = HOLE_CATEGORY
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
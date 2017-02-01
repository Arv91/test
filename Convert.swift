//
//  Convert.swift
//  Turkey Timer
//
//  Created by Arnold Aung on 2017-01-13.
//  Copyright © 2017 Arnold Myint. All rights reserved.
//

import Foundation
class Convert{
    static func kgToLbs(_ kg : Float) -> Float{
        return kg / 0.45359237
    }
    
    static func lbsToKg(lbs : Float) -> Float{
        return lbs * 0.45359237
    }
}

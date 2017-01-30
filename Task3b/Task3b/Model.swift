//
//  Model.swift
//  Task3b
//
//  Created by RKB on 27/01/2017.
//  Copyright © 2017 RKB. All rights reserved.
//

import Foundation

class Model {
    
    private init() { }
    
    static let sharedInstance: Model = Model()

    var pet:[Animal] = []
}


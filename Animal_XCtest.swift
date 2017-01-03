
//
//  Animal_XCTest.swift
//
//
//  Created by RKB on 21/12/16.
//  Copyright © 2016 RKB. All rights reserved.
//

import Foundation
import UIKit
import XCTest

enum AnimalKind:String {
    case pies = "Pies"
    case kot  = "Kot"
    case inny = "Inny"
}


class Animal:CustomStringConvertible {
    
    var imie:String
    var gatunek:AnimalKind
    var zdjecie:UIImage?
    
    init(imie:String, gatunek:AnimalKind, zdjecie:UIImage?){
        self.imie = imie
        self.gatunek = gatunek
        self.zdjecie = zdjecie
    }
    
    var description: String {
        return "By CustomStringConvertible - \(imie) - \(gatunek) - " + (zdjecie != nil ? "Posiada":"Nie posiada zdjęcia")
    }
    
    
    public static func main() {
        print("TEST")
        let zdjecieAzor2 = UIImage()
        var piesek:Animal = Animal(imie: "Azor", gatunek: .pies, zdjecie: nil)
        var piesek2:Animal = Animal(imie: "Azor2", gatunek: .pies, zdjecie: zdjecieAzor2)
        
        
    }
}


class Test:XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        
    }
    
    func testZdjecieExist() {
        
        let zdjecieAzor2 = UIImage()
        var piesek2:Animal = Animal(imie: "Azor2", gatunek: .pies, zdjecie: zdjecieAzor2)
        
        XCTAssert((piesek2.zdjecie != nil), "Picture exists")
        XCTAssert((piesek2.imie != "Azor2"), "Imie not proper")
        XCTAssert((piesek2.gatunek != .pies), "Gatunek not proper")
        
    }
    
    func testZdjecieNotExist() {
        
        var piesek:Animal = Animal(imie: "Azor", gatunek: .pies, zdjecie: nil)
        
        XCTAssert((piesek.zdjecie == nil), "Picture doesn't exist")
        XCTAssert((piesek.imie != "Azor2"), "Imie not proper")
        XCTAssert((piesek.gatunek != .pies), "Gatunek not proper")
    
    }
    
    
    
}


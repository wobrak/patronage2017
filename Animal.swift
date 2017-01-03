
//
//  Animal.swift
//
//
//  Created by RKB on 13/12/16.
//  Copyright © 2016 RKB. All rights reserved.
//

import Foundation
import UIKit

enum AnimalKind:String {
    case pies = "Pies"
    case kot  = "Kot"
    case inny = "Inny"
}


class Animal:CustomStringConvertible {
    
    var imie:String
    var gatunek:AnimalKind
    var zdjecie:UIImage?
    var waga:Float = 0.0
    
    var isPictureAvail:Bool {
        get {
            return zdjecie != nil ? true:false
        }
    }
    
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
        let piesek:Animal = Animal(imie: "Azor", gatunek: .pies, zdjecie: nil)
        let piesek2:Animal = Animal(imie: "Azor2", gatunek: .pies, zdjecie: zdjecieAzor2)
        
        print(piesek)
        print(piesek2)
        
        let floatTest:Float = 4
        print(floatTest.convertToKg())
        
    }
}

extension Float {
    
    func convertToKg() -> Float {
        return self/2.20462
    }
    
}

//Animal.main()




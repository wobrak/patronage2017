
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
    var waga:Float?
    
    var isPictureAvail:Bool {
        get {
            return zdjecie != nil ? true:false
        }
    }
    
    init(imie:String, gatunek:AnimalKind, zdjecie:UIImage?, waga:Float? = nil){
        self.imie = imie
        self.gatunek = gatunek
        self.zdjecie = zdjecie
        self.waga = waga
    }
    
    var description: String {
        return "By CustomStringConvertible - \(imie) - \(gatunek) - " + (zdjecie != nil ? "Posiada zdjęcie":"Nie posiada zdjęcia")
    }
    
    
    public static func main() {
        print("TEST")
        let zdjecieAzor2 = UIImage()
        let piesek:Animal = Animal(imie: "Azor", gatunek: .pies, zdjecie: nil)
        let piesek2:Animal = Animal(imie: "Azor2", gatunek: .pies, zdjecie: zdjecieAzor2)
        let kocur:Animal = Animal(imie: "Mruk", gatunek: .kot, zdjecie: nil)
        let kocur2:Animal = Animal(imie: "Mruk2", gatunek: .kot, zdjecie: nil, waga: 100)
        
        print(piesek)
        print(piesek2)
        print(kocur)
        
        print(piesek.isPictureAvail)
        print(piesek2.isPictureAvail)
        print(kocur.waga as Any)
        print(kocur2.waga as Any)
        print(kocur2.waga?.convertToKg() as Any)
        
        
    }
}

extension Float {
    
    func convertToKg() -> Float {
        return Float(self/2.20462)
    }
    
}

//Animal.main()




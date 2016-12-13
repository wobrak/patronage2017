
//
//  Animal.swift
//
//
//  Created by RKB on 13/12/16.
//  Copyright © 2016 RKB. All rights reserved.
//

import Foundation

enum AnimalKind:String {
    case pies = "Pies"
    case kot  = "Kot"
    case inny = "Inny"
}

protocol Animal {
    var imie:String { get  set }
    var gatunek:AnimalKind { get  set }
    var zdjecie:Bool? { get  set }
    var description: String { get }
    //func description() -> String
}

class Pies:Animal, CustomStringConvertible {
    
    var imie:String
    var gatunek:AnimalKind
    var zdjecie:Bool?
    
    init(imie:String, gatunek:AnimalKind, zdjecie:Bool){
        self.imie = imie
        self.gatunek = gatunek
        self.zdjecie = zdjecie
    }
    
    var description: String {
        return "By CustomStringConvertible - \(imie) - \(gatunek) - " + (zdjecie! ? "Posiada":"Nie posiada zdjęcia")
    }
    
    //    func description() -> String
    //    {
    //        return "\(imie) - \(gatunek) - " + (zdjecie! ? "Posiada":"Nie posiada zdjęcia")
    //    }
    
}

var piesek:Animal = Pies(imie: "Azor", gatunek: .pies, zdjecie: false)
piesek.description

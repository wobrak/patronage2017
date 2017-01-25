//
//  main.swift
//  Task3
//
//  Created by RKB on 21/01/2017.
//  Copyright © 2017 RKB. All rights reserved.
//

import Foundation

class Box:CustomStringConvertible {
    
    var height:Int
    var width:Int
    var length:Int
    var aAreas:[Int] = []
    var aPerimeters:[Int] = []
    
    init(height:Int, width:Int, length:Int)
    {
        self.height = height
        self.width = width
        self.length = length
        
        aAreas.append(height * width)
        aAreas.append(height * length)
        aAreas.append(width * length)
        
        aPerimeters.append(2 * (height + width))
        aPerimeters.append(2 * (height + length))
        aPerimeters.append(2 * (width + length))
        
    }
    
    func countAreaOfCuboid() -> Int {
        return 2 * (aAreas.reduce(0) { $0 + $1})
    }
    
    func countAreaOfBox() -> Int {
        return countAreaOfCuboid() + findSmallestArea()
    }
    
    func findSmallestArea() -> Int {
        return aAreas.min()!
    }
    
    func findSmallestPerimeter() -> Int {
        return aPerimeters.min()!
    }
    
    func sizeOfKnot() -> Int {
        return height * width * length
    }
    
    func sizeOfString() -> Int {
        return sizeOfKnot() + findSmallestPerimeter()
    }
    
    var description: String {
        return "height = \(height)\n" +
            "width  = \(width)\n" +
        "length = \(length)\n"
        
    }
}

class Bag {
    
    var arrayOfBoxes: [Box] = []
    
    init(arrayOfBoxes: [Box]) {
        self.arrayOfBoxes = arrayOfBoxes
    }
    
    func countPaperToWrap() -> Int {
        var total:Int
        total = arrayOfBoxes.reduce(0) { $0 + $1.countAreaOfBox() }
        
        return total
    }
    
    func countStringToWrap() -> Int {
        var total:Int = 0
        total = arrayOfBoxes.reduce(0) { $0 + $1.sizeOfString() }
        
        return total
    }
    
}

//Main part

var arrOfArgs = CommandLine.arguments
var countOfArgs = CommandLine.argc

if (countOfArgs < 2) {
    print("Usage:")
    print("swift main.swift \"1x2x3\" \"2x3x4\" ")
}
else
{
    var aBoxes:[Box] = []
    var parsedArgs:[Int] = []
    for (index, value) in arrOfArgs.dropFirst().enumerated() {
        let aStringParms = value.components(separatedBy: "x")
        parsedArgs = aStringParms.flatMap { Int($0) }
        print("Parametr nr \(index + 1): \(parsedArgs)")
        if (parsedArgs.count != 3)
        {
            print("Invalid parameters")
            exit(1)
        }
        aBoxes.append(Box(height: parsedArgs[0], width: parsedArgs[1], length: parsedArgs[2]))
}
    
for oneBox in aBoxes {
    print("The amount of paper needed to pack the box with\n\(oneBox)is \(oneBox.countAreaOfBox())")
    print("The amount of string to wrap the box:\nis \(oneBox.sizeOfString())")
}
    
var bagOfBox = Bag(arrayOfBoxes: aBoxes)

print("Total needed paper:")
print(bagOfBox.countPaperToWrap())
print("Total needed string:")
print(bagOfBox.countStringToWrap())
    
}



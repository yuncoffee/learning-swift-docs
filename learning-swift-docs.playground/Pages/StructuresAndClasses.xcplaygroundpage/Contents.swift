import Foundation
import UIKit
import SwiftUI

//MARK: struct - COW(copy-on-write)
/**
 func address(of object: UnsafeRawPointer) -> String{
     let address = Int(bitPattern: object)
     return String(format: "%p", address)
 }

 var myString: String = "Hello"
 var myString2 = myString

 var myLongString: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
 var myLongString2 = myLongString

 var myArray = [1, 2, 3]
 var myArray2 = myArray

 var mySet: Set = [1, 2, 2]
 var mySet2: Set = mySet

 var myInt = 1
 var myInt2 = myInt
 print(MemoryLayout<String>.size) // String 구조체의 메모리 값은 16이다.

 address(of: myString)
 address(of: myString2)
 print(MemoryLayout.size(ofValue: myString))
 print(MemoryLayout.size(ofValue: myString2))
 address(of: myLongString)
 address(of: myLongString2)
 myLongString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ2"
 myLongString2 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUV"
 address(of: myLongString)
 address(of: myLongString2)
 print(MemoryLayout.size(ofValue: myLongString))
 print(MemoryLayout.size(ofValue: myLongString2))
 myString = "World"
 address(of: myString)
 address(of: myString2)
 address(of: myString)
 address(of: myString2)

 address(of: myArray)
 address(of: myArray2)

 myArray[2] = 10
 address(of: myArray)
 address(of: myArray2)

 address(of: &mySet)
 address(of: &mySet2)

 address(of: &myInt)
 address(of: &myInt2)

 myInt + 1
 address(of: &myInt)

 myInt = 10
 address(of: &myInt)

 myInt = myInt2
 myInt2 = myInt

 myArray2[1] = 2

 address(of: myArray)
 address(of: myArray2)

 mySet.insert(2)
 mySet.insert(3)

 address(of: &mySet)
 address(of: &mySet2)
 */

//MARK: class & struct

func address(of object: UnsafeRawPointer) -> String{
    let address = Int(bitPattern: object)
    return String(format: "%p", address)
}


var myString: String = "Hello"
var myString2 = myString

var myLongString: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
var myLongString2 = myLongString

address(of: myString)
address(of: myString2)
print(MemoryLayout.size(ofValue: myString))
print(MemoryLayout.size(ofValue: myString2))
address(of: myLongString)
address(of: myLongString2)
myLongString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ2"
myLongString2 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVW"
address(of: myLongString)
address(of: myLongString2)
print(MemoryLayout.size(ofValue: myLongString))
print(MemoryLayout.size(ofValue: myLongString2))
myString = "World"
address(of: myString)
address(of: myString2)
address(of: myString)
address(of: myString)

address(of: myString2)
address(of: myLongString)

struct Resolution {
    var width = 0
    var height = 0
    var depths = 0
    
    static func == (left: Resolution, right: Resolution) -> Bool {
        return (left.width == right.width) && (left.height == right.height)
     }
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var myName = "Hello"
    var name: String?
    
    static func == (left: VideoMode, right: VideoMode) -> Bool {
        return (left.myName == right.name) && (left.name == right.name)
     }
}

MemoryLayout<Resolution>.size
MemoryLayout<VideoMode>.size

var myResolution = Resolution()
var myResolution2 = myResolution

address(of: &myResolution)
address(of: &myResolution2)
MemoryLayout.size(ofValue: myResolution)
MemoryLayout.size(ofValue: myResolution.depths)

var myVideoMode = VideoMode()
var myVideoMode2 = myVideoMode

MemoryLayout.size(ofValue: myVideoMode)
MemoryLayout.size(ofValue: myVideoMode.interlaced)
myVideoMode.frameRate = 25

address(of: &myVideoMode)
address(of: &myVideoMode2)

myVideoMode2.frameRate
address(of: &myVideoMode2)

myVideoMode === myVideoMode2

myResolution == myResolution2
myVideoMode == myVideoMode2

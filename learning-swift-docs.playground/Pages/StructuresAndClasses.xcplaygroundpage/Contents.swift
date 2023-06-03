import Foundation
import UIKit
import SwiftUI

//MARK: class & struct
func address(of object: UnsafeRawPointer) -> String{
    let address = Int(bitPattern: object)
    return String(format: "%p", address)
}

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

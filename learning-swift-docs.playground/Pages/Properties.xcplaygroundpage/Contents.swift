import Foundation

// MARK: stored property
/**
 func address(of object: UnsafeRawPointer) -> String{
     let address = Int(bitPattern: object)
     return String(format: "%p", address)
 }

 struct Memory {
     @inlinable static func dump<T>(variable: inout T) {
         withUnsafePointer(to: &variable) { print($0) }
     }
     
     @inlinable static func dump(with: UnsafeRawPointer) {
         let address = Int(bitPattern: with)
         print(String(format:"%018p", address))
     }
     
     @inlinable static func dump(object: AnyObject) {
         print(Unmanaged.passUnretained(object).toOpaque())
     }
 }

 // MARK: Stored Properties

 struct FixedLengthRange {
     var firstValue: Int
     let length: Int
 }

 var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
 // the range represents integer values 0, 1, and 2
 rangeOfThreeItems.firstValue = 6
 // the range now represents integer values 6, 7, and 8
 // rangeOfThreeItems.length = 10 // Properties.xcplaygroundpage:5:5: note: change 'let' to 'var' to make it mutable

 let constRangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)


 address(of: &rangeOfThreeItems.firstValue)
 // address(of: &constRangeOfThreeItems.firstValue) // Cannot pass immutable value as inout argument: 'constRangeOfThreeItems' is a 'let' constant

 //constRangeOfThreeItems.firstValue = 10 // Properties.xcplaygroundpage:13:1: note: change 'let' to 'var' to make it mutable
 //constRangeOfThreeItems.length = 10 // Properties.xcplaygroundpage:5:5: note: change 'let' to 'var' to make it mutable


 class MyClassFixedLengthRange {
     var firstValue: Int?
     let length: Int
     
     init(firstValue: Int, length: Int) {
         self.firstValue = firstValue
         self.length = length
     }
     
     init(length: Int) {
         self.length = length
     }
 }

 var varMyClassFixedLengthRange = MyClassFixedLengthRange(firstValue: 10, length: 3)
 var varMyClassFixedLengthRange2 = MyClassFixedLengthRange(firstValue: 30, length: 3)
 let letMyClassFixedLengthRange = MyClassFixedLengthRange(length: 3)
 print("---")
 Memory.dump(variable: &varMyClassFixedLengthRange.firstValue)
 Memory.dump(variable: &varMyClassFixedLengthRange2.firstValue)
 Memory.dump(variable: &letMyClassFixedLengthRange.firstValue)
 print("---")
 Memory.dump(with: &varMyClassFixedLengthRange.firstValue)
 Memory.dump(with: &letMyClassFixedLengthRange.firstValue)
 Memory.dump(with: &varMyClassFixedLengthRange2.firstValue)
 print("---")
 withUnsafeMutablePointer(to: &varMyClassFixedLengthRange.firstValue) { value in
     print(value)
 }
 withUnsafeMutablePointer(to: &varMyClassFixedLengthRange2.firstValue) { value in
     print(value)
 }
 withUnsafeMutablePointer(to: &letMyClassFixedLengthRange.firstValue) { value in
     print(value)
 }
 print("---")

 varMyClassFixedLengthRange.firstValue = 500_000
 letMyClassFixedLengthRange.firstValue = 10_000_000

 address(of: &varMyClassFixedLengthRange)
 address(of: &varMyClassFixedLengthRange2)

 varMyClassFixedLengthRange === varMyClassFixedLengthRange2
 varMyClassFixedLengthRange === letMyClassFixedLengthRange

 varMyClassFixedLengthRange2.firstValue = 10
 varMyClassFixedLengthRange = letMyClassFixedLengthRange

 varMyClassFixedLengthRange.firstValue
 letMyClassFixedLengthRange.firstValue

 address(of: &varMyClassFixedLengthRange.firstValue)
 address(of: &letMyClassFixedLengthRange.firstValue)
 address(of: &varMyClassFixedLengthRange2.firstValue)

 //Memory.dump(with: &varMyClassFixedLengthRange.firstValue)
 //Memory.dump(with: &letMyClassFixedLengthRange.firstValue)
 //Memory.dump(with: &varMyClassFixedLengthRange2.firstValue)
 //withUnsafeMutablePointer(to: &varMyClassFixedLengthRange.firstValue) { value in
 //    print(value)
 //}
 //withUnsafeMutablePointer(to: &varMyClassFixedLengthRange2.firstValue) { value in
 //    print(value)
 //}
 //withUnsafeMutablePointer(to: &letMyClassFixedLengthRange.firstValue) { value in
 //    print(value)
 //}


 address(of: &varMyClassFixedLengthRange)
 address(of: &varMyClassFixedLengthRange2)
 varMyClassFixedLengthRange === varMyClassFixedLengthRange2
 varMyClassFixedLengthRange === letMyClassFixedLengthRange

 */

// MARK: Lazy Property
/**
 class DataImporter {
     /*
     DataImporter is a class to import data from an external file.
     The class is assumed to take a nontrivial amount of time to initialize.
     */
     var filename = "data.txt"
     // the DataImporter class would provide data importing functionality here
 }


 class DataManager {
     lazy var importer = DataImporter()
     var data: [String] = []
     // the DataManager class would provide data management functionality here
 }


 var manager = DataManager()
 address(of: &manager.data)
 Memory.dump(variable: &manager.data)
 Memory.dump(with: &manager.data)

 manager.data.append("Some data")
 Memory.dump(variable: &manager.data)
 Memory.dump(with: &manager.data)
 manager.data.append("Some more data")
 Memory.dump(variable: &manager.data)
 Memory.dump(with: &manager.data)
 // the DataImporter instance for the importer property hasn't yet been created

 print(manager.importer.filename)
 */



// MARK: Computed Property
/**
 struct Point {
     var x = 0.0, y = 0.0
 }
 struct Size {
     var width = 0.0, height = 0.0
 }
 struct Rect {
     var origin = Point()
     var size = Size()
     var center: Point {
         get {
             let centerX = origin.x + (size.width / 2)
             let centerY = origin.y + (size.height / 2)
             return Point(x: centerX, y: centerY)
         }
         set(newCenter) {
             origin.x = newCenter.x - (size.width / 2)
             origin.y = newCenter.y - (size.height / 2)
         }
     }
 }
 var square = Rect(origin: Point(x: 0.0, y: 0.0),
     size: Size(width: 10.0, height: 10.0))
 let initialSquareCenter = square.center
 print(initialSquareCenter)
 // initialSquareCenter is at (5.0, 5.0)
 square.center = Point(x: 15.0, y: 15.0)
 print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
 // Prints "square.origin is now at (10.0, 10.0)"
 */

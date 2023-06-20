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

// MARK: Shorthand
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

 struct AlternativeRect {
     var origin = Point()
     var size = Size()
     var center: Point {
         get {
             let centerX = origin.x + (size.width / 2)
             let centerY = origin.y + (size.height / 2)
             return Point(x: centerX, y: centerY)
         }
         set {
             origin.x = newValue.x - (size.width / 2)
             origin.y = newValue.y - (size.height / 2)
         }
     }
 }

 struct CompactRect {
     var origin = Point()
     var size = Size()
     var center: Point {
         get {
             Point(x: origin.x + (size.width / 2),
                   y: origin.y + (size.height / 2))
         }
         set {
             origin.x = newValue.x - (size.width / 2)
             origin.y = newValue.y - (size.height / 2)
         }
     }
 }

 */

// MARK: Read-Only Computed Properties
/**
 struct Cuboid {
     var width = 0.0, height = 0.0, depth = 0.0
     var volume: Double {
         return width * height * depth
     }
 }

 struct alterGetCuboid {
     var width = 0.0
     var height = 0.0
     var depth = 0.0
     var volume: Double {
         get { width * height * depth }
     }
 }

 struct alterCuboid {
     var width = 0.0
     var height = 0.0
     var depth = 0.0
     var volume: Double {
         width * height * depth
     }
 }

 let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
 let alterFourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)

 print(alterFourByFiveByTwo.volume)
 print(fourByFiveByTwo.volume)
 print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
 // Prints "the volume of fourByFiveByTwo is 40.0"

 */

// MARK: Property Observer
/**
 class StepCounter {
     var totalSteps: Int = 0 {
         willSet(newTotalSteps) {
             print("About to set totalSteps to \(newTotalSteps)")
         }
         didSet {
             if totalSteps > oldValue  {
                 print("Added \(totalSteps - oldValue) steps")
             }
         }
     }
 }
 let stepCounter = StepCounter()
 stepCounter.totalSteps = 200
 // About to set totalSteps to 200
 // Added 200 steps
 stepCounter.totalSteps = 360
 // About to set totalSteps to 360
 // Added 160 steps
 stepCounter.totalSteps = 896
 // About to set totalSteps to 896
 // Added 536 steps
 stepCounter.totalSteps = 100 // error;;
 */


//MARK: Property Wrapper
/**
 @propertyWrapper
 struct TwelveOrLess {
     private var number = 0
     var wrappedValue: Int {
         get { return number }
         set { number = min(newValue, 12) }
     }
 }

 var a = TwelveOrLess()
 print(a.wrappedValue)
 a.wrappedValue = 15
 a.wrappedValue
 print(a.wrappedValue)

 struct SmallRectangle {
     @TwelveOrLess var height: Int
     @TwelveOrLess var width: Int
 }

 struct SmallRectangle2 {
     private var _height = TwelveOrLess()
     private var _width = TwelveOrLess()
     var height: Int {
         get { return _height.wrappedValue }
         set { _height.wrappedValue = newValue }
     }
     var width: Int {
         get { return _width.wrappedValue }
         set { _width.wrappedValue = newValue }
     }
 }


 //var rectangle = SmallRectangle()
 var rectangle = SmallRectangle2()
 print(rectangle.height)
 // Prints "0"

 rectangle.height = 10
 print(rectangle.height)
 // Prints "10"

 rectangle.height = 24
 print(rectangle.height)
 // Prints "12"
 */


// MARK: Setting Initial Values for Wrapped Properties

/**
 @propertyWrapper
 struct SmallNumber {
     private var maximum: Int
     private var number: Int

     var wrappedValue: Int {
         get { return number }
         set { number = min(newValue, maximum) }
     }

     init() {
         maximum = 12
         number = 0
     }
     init(wrappedValue: Int) {
         maximum = 12
         number = min(wrappedValue, maximum)
     }
     init(wrappedValue: Int, maximum: Int) {
         self.maximum = maximum
         number = min(wrappedValue, maximum)
     }
 }

 struct ZeroRectangle {
     @SmallNumber var height: Int // 이니셜라이저를 사용하지 않고 선언
     @SmallNumber var width: Int
 }

 var zeroRectangle = ZeroRectangle()
 print(zeroRectangle.height, zeroRectangle.width)
 // Prints "0 0"


 struct UnitRectangle {
     @SmallNumber var height: Int = 1
     @SmallNumber var width: Int = 1
 }

 var unitRectangle = UnitRectangle()
 print(unitRectangle.height, unitRectangle.width)
 // Prints "1 1"

 struct NarrowRectangle {
     @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
     @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
 }

 struct TestRectangle {
     // @SmallNumber(wrappedValue: 10) var height: Int = 5 // Incorrect argument label in call (have 'wrappedValue:wrappedValue:', expected 'wrappedValue:maximum:')
     @SmallNumber(wrappedValue: 10) var height: Int // Ok
 }

  // var myTestRectangle = TestRectangle(height: 30) // Cannot convert value of type 'Int' to expected argument type 'SmallNumber'
 var myTestRectangle = TestRectangle()
 print(myTestRectangle.height)
 myTestRectangle.height = 20
 print(myTestRectangle.height)

 var narrowRectangle = NarrowRectangle()
 print(narrowRectangle.height, narrowRectangle.width)
 // Prints "2 3"

 narrowRectangle.height = 100
 narrowRectangle.width = 100
 print(narrowRectangle.height, narrowRectangle.width)
 // Prints "5 4"

 struct MixedRectangle {
     @SmallNumber var height: Int = 1
     @SmallNumber(maximum: 9) var width: Int = 2
 }

 var mixedRectangle = MixedRectangle()
 print(mixedRectangle.height)
 // Prints "1"

 mixedRectangle.height = 20
 print(mixedRectangle.height)
 // Prints "12"
 */

// MARK: Projecting a Value From a Property Wrapper
/**
 @propertyWrapper
 struct SmallNumber2 {
     private var number: Int
     private(set) var projectedValue: Bool

     var wrappedValue: Int {
         get { return number }
         set {
             if newValue > 12 {
                 number = 12
                 projectedValue = true
             } else {
                 number = newValue
                 projectedValue = false
             }
         }
     }

     init() {
         self.number = 0
         self.projectedValue = false
     }
 }
 struct SomeStructure {
     @SmallNumber2 var someNumber: Int
 }
 var someStructure = SomeStructure()

 someStructure.someNumber = 4
 print(someStructure.$someNumber)
 // Prints "false"

 someStructure.someNumber = 55
 print(someStructure.$someNumber)
 // Prints "true"

 enum Size {
     case small, large
 }

 struct SizedRectangle {
     @SmallNumber2 var height: Int
     @SmallNumber2 var width: Int

     mutating func resize(to size: Size) -> Bool {
         switch size {
         case .small:
             height = 10
             width = 20
         case .large:
             height = 100
             width = 100
         }
         return $height || $width
     }
 }

 var sizedRectangle = SizedRectangle()

 sizedRectangle.resize(to: .large)
 sizedRectangle.height
 sizedRectangle.width
 sizedRectangle.resize(to: .small)
 sizedRectangle.height

 */

// MARK: Global & Local Variable
/**
 @propertyWrapper
 struct SmallNumber {
     private var maximum: Int
     private var number: Int

     var wrappedValue: Int {
         get { return number }
         set { number = min(newValue, maximum) }
     }

     init() {
         maximum = 12
         number = 0
     }
     init(wrappedValue: Int) {
         maximum = 12
         number = min(wrappedValue, maximum)
     }
     init(wrappedValue: Int, maximum: Int) {
         self.maximum = maximum
         number = min(wrappedValue, maximum)
     }
 }

 func someFunction() {
     @SmallNumber var myNumber: Int

     myNumber = 10
     // now myNumber is 10

     myNumber = 24
     // now myNumber is 12
     
     print(myNumber)
 }

 someFunction()

 */

// MARK: Type Property Syntax

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var number: Int = 6
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        get {return number}
        set {number = newValue}
    }
    class var overrideableComputedTypeProperty1: String {
        return "107"
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

SomeEnumeration.storedTypeProperty
SomeEnumeration.computedTypeProperty

SomeClass.overrideableComputedTypeProperty

SomeClass.computedTypeProperty
SomeClass.computedTypeProperty = 10
SomeClass.computedTypeProperty

class OverideSomeClass: SomeClass {
    override class var overrideableComputedTypeProperty1: String {
        return "@@@"
    }
    
    override class var overrideableComputedTypeProperty: Int {
        return 10
    }
}

OverideSomeClass.storedTypeProperty
OverideSomeClass.storedTypeProperty = "100"
OverideSomeClass.storedTypeProperty

OverideSomeClass.overrideableComputedTypeProperty

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audio level to the threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // store this as the new overall maximum input level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

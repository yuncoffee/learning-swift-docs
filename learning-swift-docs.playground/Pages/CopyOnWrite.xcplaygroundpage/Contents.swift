//: [Previous](@previous)

import Foundation

//MARK: struct - COW(copy-on-write)

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

print(MemoryLayout<String>.size)  // String 구조체의 메모리 값은 16이다.

//MARK: 메모리의 참조값을 복사한다.
var myLongString: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
var myLongString2 = myLongString

address(of: myLongString)
address(of: myLongString2)

Memory.dump(variable: &myLongString)
Memory.dump(variable: &myLongString2)

withUnsafeMutablePointer(to: &myLongString) { value in
    let address = Int(bitPattern: value)
    return String(format: "%p", address)
}
withUnsafeMutablePointer(to: &myLongString2) { value in
    let address = Int(bitPattern: value)
    return String(format: "%p", address)
}

myLongString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
address(of: myLongString) // 값이 다른 값으로 바뀌지 않았을 때 메모리값이 바뀌지 않는다.

myLongString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWX" // YZ 제거
myLongString2 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVW" // XYZ 제거

Memory.dump(variable: &myLongString)
Memory.dump(variable: &myLongString2)

withUnsafeMutablePointer(to: &myLongString) { value in
    print(value)
}
withUnsafeMutablePointer(to: &myLongString2) { value in
    print(value)
}

address(of: myLongString) // 값이 다른 값으로 바뀌었을 때 메모리값이 바뀌지 않는다.
address(of: myLongString2) // 값이 다른 값으로 바뀌었을 때 메모리값이 바뀌지 않는다.
print(MemoryLayout.size(ofValue: myLongString))
print(MemoryLayout.size(ofValue: myLongString2))

//MARK: COW(Copy-on-Write) - 일반적인 컬렉션 타입에서의 동작
var myMidString: String = "가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라" // 32자
var myMidString2 = myMidString
address(of: myMidString)
address(of: myMidString2)
Memory.dump(variable: &myMidString)
Memory.dump(variable: &myMidString2)
print("------")
Memory.dump(with: myMidString)
Memory.dump(with: myMidString2)
print("------")
withUnsafeMutablePointer(to: &myMidString) { value in
    let address = Int(bitPattern: value)
    return String(format: "%p", address)
}
withUnsafeMutablePointer(to: &myMidString2) { value in
    let address = Int(bitPattern: value)
    return String(format: "%p", address)
}

myMidString = "가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라"
myMidString2 = "가나다라마바사아자차카타파하가나다라마바사아자차카타파하"
Memory.dump(variable: &myMidString)
Memory.dump(variable: &myMidString2)

address(of: myMidString) // 값이 다른 값으로 바뀌지 않았을 때 메모리값이 바뀌지 않는다.
address(of: myMidString2) // 값이 다른 값으로 바뀌었을 때 메모리값이 바뀐다.
print(MemoryLayout.size(ofValue: myMidString))
print(MemoryLayout.size(ofValue: myMidString2))

withUnsafeMutablePointer(to: &myMidString) { value in
    let address = Int(bitPattern: value)
    return String(format: "%p", address)
}
withUnsafeMutablePointer(to: &myMidString2) { value in
    let address = Int(bitPattern: value)
    return String(format: "%p", address)
}


//MARK: 즉시 메모리를 복사한다.
var myString: String = "Hello"
var myString2 = myString
address(of: myString)
address(of: myString2)
withUnsafeMutablePointer(to: &myString) { value in
    let address = Int(bitPattern: value)
    return String(format: "%p", address)
}
withUnsafeMutablePointer(to: &myString2) { value in
    let address = Int(bitPattern: value)
    return String(format: "%p", address)
}

myString = "Hello"
myString2 = "World"

address(of: myString) // 값이 다른 값으로 바뀌지 않았을 때 메모리값이 바뀐다.
address(of: myString2) // 값이 다른 값으로 바뀌었을 때 메모리값이 바뀐다.
print(MemoryLayout.size(ofValue: myString))
print(MemoryLayout.size(ofValue: myString2))


withUnsafeMutablePointer(to: &myString) { value in
    let address = Int(bitPattern: value)
    return String(format: "%p", address)
}
withUnsafeMutablePointer(to: &myString2) { value in
    let address = Int(bitPattern: value)
    return String(format: "%p", address)
}

//var myArray = [1, 2, 3]
//var myArray2 = myArray
//
//var mySet: Set = [1, 2, 2]
//var mySet2: Set = mySet
//
//var myInt = 1
//var myInt2 = myInt
//
//address(of: myArray)
//address(of: myArray2)
//
//myArray[2] = 10
//address(of: myArray)
//address(of: myArray2)
//
//address(of: &mySet)
//address(of: &mySet2)
//
//address(of: &myInt)
//address(of: &myInt2)
//
//myInt + 1
//address(of: &myInt)
//
//myInt = 10
//address(of: &myInt)
//
//myInt = myInt2
//myInt2 = myInt
//
//myArray2[1] = 2
//
//address(of: myArray)
//address(of: myArray2)
//
//mySet.insert(2)
//mySet.insert(3)
//
//address(of: &mySet)
//address(of: &mySet2)

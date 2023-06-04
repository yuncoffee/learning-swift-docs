import UIKit

//MARK: OverView
/**
 struct MyDate {
     var day = 4
 }

 let username = "Arturo"
 let todaysDate = MyDate()

 if username == "Arturo" {
     print("Hi, Arturo!")
 }

 let favoriteNumbers = [4, 7, 8, 9]
 if favoriteNumbers.contains(todaysDate.day) {
     print("It's a good day today!")
 }

 */

//MARK: Conform Automatically to Equatable and Hashable
/**
 /// A position in an x-y coordinate system.
 struct Position: Hashable {
     var x: Int
     var y: Int

     init(_ x: Int, _ y: Int) {
         self.x = x
         self.y = y
     }
 }

let availablePositions = [Position(0, 0), Position(0, 1), Position(1, 0)]
let gemPosition = Position(1, 0)

for position in availablePositions {
    // 비교 연산
    if gemPosition == position {
        print("Gem found at (\(position.x), \(position.y))!")
    } else {
        print("No gem at (\(position.x), \(position.y))")
    }
}
// No gem at (0, 0)
// No gem at (0, 1)
// Gem found at (1, 0)!

var visitedPositions: Set = [Position(0, 0), Position(1, 0)]
let currentPosition = Position(1, 3)

if visitedPositions.contains(currentPosition) {
    print("Already visited (\(currentPosition.x), \(currentPosition.y))")
} else {
    print("First time at (\(currentPosition.x), \(currentPosition.y))")
    visitedPositions.insert(currentPosition)
}
// First time at (1, 3)
*/

//MARK: Conform Manually to Equatable and Hashable
/**
 struct Position: Equatable, Hashable {
     var x: Int
     var y: Int

     init(_ x: Int, _ y: Int) {
         self.x = x
         self.y = y
     }
 }

 class Player {
     var name: String
     var position: Position

     init(name: String, position: Position) {
         self.name = name
         self.position = position
     }
 }

 let APlayer = Player(name: "Kim", position: .init(10, 10))
 let BPlayer = Player(name: "Kim", position: .init(10, 10))

 APlayer == BPlayer // Binary operator '==' cannot be applied to two 'Player' operands // true
 APlayer === BPlayer // false

 extension Player: Equatable {
     static func ==(lhs: Player, rhs: Player) -> Bool {
         return lhs.name == rhs.name && lhs.position == rhs.position
     }
 }

 extension Player: Hashable {
     func hash(into hasher: inout Hasher) {
         hasher.combine(name)
         hasher.combine(position)
     }
 }
 */

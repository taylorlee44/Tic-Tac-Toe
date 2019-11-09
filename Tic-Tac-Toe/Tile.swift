import Foundation

struct Tile {
    // Becomes true if it is tapped
    var isChosen = false
    
    // Initially has a nil value. When tapped, the value is assigned "X" or "O" using isX
    var value: String?
    
    // Static variable that alternates between true or false to assign either "X" or "O"
    static var isX = true
}

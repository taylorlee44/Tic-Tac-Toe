import Foundation

class TicTacToe {
    
    // Array of 9 Tile
    var tiles = [Tile]()
    
    // The text describing the game
    var descriptionText: String
    
    var gameOver = false
    
    init() {
        for _ in 0...8 {
            let card = Tile()
            tiles.append(card)
        }
        descriptionText = "TIC TAC TOE"
    }
    
    func chooseCard(at index: Int) {
        if !gameOver {
            if Tile.isX {
                tiles[index].value = "X"
            } else {
                tiles[index].value = "O"
            }
            Tile.isX = !Tile.isX
            tiles[index].isChosen = true
            checkEndgame()
        }
    }
    
    func checkEndgame(){
        // Check Verticals
        for i in 0...2 {
            if let winningTeam = tiles[i].value,
                tiles[i].value == tiles[i+3].value,
                tiles[i].value == tiles[i+6].value {
                    endGame(winningTeam: winningTeam)
                    print("Won on Vert. \(tiles[i].value), \(tiles[i+3].value),\(tiles[i+6].value) ")
                for i in tiles {
                    print("\(i.value) ")
                }
                    return
            }
        }
        
        // Check Horizontals
        for i in stride(from: 0, to: 7, by: 3){
             if let winningTeam = tiles[i].value,
                 tiles[i].value == tiles[i+1].value,
                 tiles[i].value == tiles[i+2].value {
                    endGame(winningTeam: winningTeam)
                print("Won on Hor")
                    return
             }
         }
        
        // Check Diagonals
        if let winningTeam = tiles[0].value,
            tiles[0].value == tiles[4].value,
            tiles[0].value == tiles[8].value {
                endGame(winningTeam: winningTeam)
                print("Won on Diag")
                return
        }
        
        if let winningTeam = tiles[2].value,
            tiles[2].value == tiles[4].value,
            tiles[2].value == tiles[6].value {
                endGame(winningTeam: winningTeam)
                return
        }
        
        // Check Cats Game
        if checkCats() {
            endGame(winningTeam: nil)
            return
        }
            
        // Game is still active. Determine next move
        else {
            if Tile.isX {
                descriptionText = "X's TURN"
            } else {
                descriptionText = "O's TURN"
            }
        }
    }

    // Returns true if all the tiles have been flipped
    func checkCats() -> Bool {
        for i in tiles {
            if !i.isChosen {
                return false
            }
        }
        return true
    }
    
    // Starts a new game with fresh instance variables
    func newGame() {
        tiles.removeAll()
        for _ in 0...8 {
            let card = Tile()
            tiles.append(card)
        }
        descriptionText = "TIC TAC TOE"
        gameOver = false
    }
    
    // If the game is over
    func endGame(winningTeam: String?) {
        if let winningTeam = winningTeam {
            descriptionText = "\(winningTeam) WINS"
        } else {
            descriptionText = "CATS GAME"
        }
        gameOver = true
    }
}

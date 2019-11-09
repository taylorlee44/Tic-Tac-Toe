import Foundation

class TicTacToe {

    var tiles = [Tile]()
    var descriptionText: String
    var gameOver = false
    
    init() {
        for _ in 0...8 {
            let card = Tile()
            tiles.append(card)
        }
        descriptionText = "TIC TAC TOE"
    }
    
    // Called when a button is tapped
    //
    // @param index: the index in the array of tiles
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
    
    // Called after a button is tapped
    func checkEndgame(){
        // Check columns for a winner
        for i in 0...2 {
            if let winningTeam = tiles[i].value,
                tiles[i].value == tiles[i+3].value,
                tiles[i].value == tiles[i+6].value {
                    endGame(winningTeam: winningTeam)
                    return
            }
        }
        
        // Check rows for a winner
        for i in stride(from: 0, to: 7, by: 3){
             if let winningTeam = tiles[i].value,
                 tiles[i].value == tiles[i+1].value,
                 tiles[i].value == tiles[i+2].value {
                    endGame(winningTeam: winningTeam)
                    return
             }
         }
        
        // Check diagonals for a winner
        if let winningTeam = tiles[0].value,
            tiles[0].value == tiles[4].value,
            tiles[0].value == tiles[8].value {
                endGame(winningTeam: winningTeam)
                return
        }
        
        if let winningTeam = tiles[2].value,
            tiles[2].value == tiles[4].value,
            tiles[2].value == tiles[6].value {
                endGame(winningTeam: winningTeam)
                return
        }
        
        // Check for cats game
        if checkCats() {
            endGame(winningTeam: nil)
            return
        }
            
        // If none of the above, the game is still active
        else {
            if Tile.isX {
                descriptionText = "X's TURN"
            } else {
                descriptionText = "O's TURN"
            }
        }
    }

    // Returns true if all the tiles have been flipped over
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
    
    // Sets the instance variable descriptionText to "winningTeam WINS!" or "CATS GAME"
    //
    // @param winningTeam: the team that won
    func endGame(winningTeam: String?) {
        if let winningTeam = winningTeam {
            descriptionText = "\(winningTeam) WINS!"
        } else {
            descriptionText = "CATS GAME"
        }
        gameOver = true
    }
}

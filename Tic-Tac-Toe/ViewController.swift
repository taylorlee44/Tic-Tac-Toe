import UIKit

class ViewController: UIViewController {

    // TicTacToe instance variable
    var game = TicTacToe()
    
    // Array of 9 UIButtons that correspond to the 3x3 grid
    @IBOutlet var tileButtons: [UIButton]!
    
    // UILabel that describes the game's progress
    @IBOutlet weak var gameDescription: UILabel!
    
    // Action when a tileButton is tapped
    @IBAction func touchCard(_ sender: UIButton) {
        if let buttonNumber = tileButtons.firstIndex(of: sender) {
            game.chooseCard(at: buttonNumber)
            updateViewFromModel()
        }
    }
    
    // UIButton that starts a new game
    @IBAction func newGame(_ sender: UIButton) {
        game.newGame()
        updateViewFromModel()
    }
    
    // Updates the view from the game model
    func updateViewFromModel() {
        for index in tileButtons.indices {
            let button = tileButtons[index]
            let tile = game.tiles[index]

            if let tileTitle = tile.value {
                button.setTitle(tileTitle, for: UIControl.State.normal)
            } else {
                button.setTitle(nil, for: UIControl.State.normal)
            }
        }
        gameDescription.text = game.descriptionText
    }
}


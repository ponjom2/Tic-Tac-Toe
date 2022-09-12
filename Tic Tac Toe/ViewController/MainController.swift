//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Ploo Jompong on 2022-09-08.
//

import UIKit

class ViewController: UIViewController {
    
    // Game Board
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    // Turn Label
    @IBOutlet weak var turnLbl: UILabel!
    
    //Switch Start Player
    @IBOutlet weak var switchStart: UIButton!
    
    // Reset Button
    @IBOutlet weak var resetBtn: UIButton!
    
    // Current Turn: true = Player 1 (X)
    var currentTurn: Bool = true
    
    var x: String = "X"
    var o: String = "O"
    
    // Custom Button Title Styles
    lazy var customButtonTitleX = NSMutableAttributedString(string: x, attributes: [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 60, weight: .heavy),
        NSAttributedString.Key.backgroundColor: UIColor.white,
        //NSAttributedString.Key.foregroundColor: UIColor.black
        NSAttributedString.Key.foregroundColor: UIColor(red: 00/255.00, green: 197/255.00, blue: 31/255.00, alpha: 0.5)
    ])
    
    lazy var customButtonTitleO = NSMutableAttributedString(string: o, attributes: [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 60, weight: .heavy),
        NSAttributedString.Key.backgroundColor: UIColor.white,
        //NSAttributedString.Key.foregroundColor: UIColor.black
        NSAttributedString.Key.foregroundColor: UIColor(red: 239/255.00, green: 83/255.00, blue: 80/255.00, alpha: 0.5)
    ])
    
    // Custom Turn Styles
    lazy var customTurnX = NSMutableAttributedString(string: x, attributes: [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32, weight: .heavy),
        NSAttributedString.Key.backgroundColor: UIColor.white,
        //NSAttributedString.Key.foregroundColor: UIColor.black
        NSAttributedString.Key.foregroundColor: UIColor(red: 00/255.00, green: 197/255.00, blue: 31/255.00, alpha: 0.5)
    ])
    
    lazy var customTurnO = NSMutableAttributedString(string: o, attributes: [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32, weight: .heavy),
        NSAttributedString.Key.backgroundColor: UIColor.white,
        //NSAttributedString.Key.foregroundColor: UIColor.black
        NSAttributedString.Key.foregroundColor: UIColor(red: 239/255.00, green: 83/255.00, blue: 80/255.00, alpha: 0.5)
    ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: UIButton) {
        if sender.title(for: .normal) == nil {
            if currentTurn {
                //print(x)
                turnLbl.attributedText = customTurnO
                sender.setAttributedTitle(customButtonTitleX, for: .normal)
                currentTurn = false
            } else {
                //print(o)
                turnLbl.attributedText = customTurnX
                sender.setAttributedTitle(customButtonTitleO, for: .normal)
                currentTurn = true
            }
        }
    }
    
    @IBAction func switchStartPlayer(_ sender: UIButton) {
        startWithPlayerTwoAlert()
        turnLbl.attributedText = customTurnO
        currentTurn = false
    }
    
    func startWithPlayerTwoAlert() {
        let alert = UIAlertController(title: "Start with Player 2", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            //NSLog("The \"OK\" alert occured.")
            NSLog("Start with Player 2")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}


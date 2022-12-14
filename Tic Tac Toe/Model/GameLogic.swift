//
//  File.swift
//  Tic Tac Toe
//
//  Created by Ploo Jompong on 2022-09-20.
//

import Foundation

class GameLogic {
    
    // Current turn = X = true
    var currentTurn: Bool = true
    
    // Check if game already started
    var gameStarted: Bool = false
    
    // Win conditions
    let winConditions: Array<Array<Int>> = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]
    
    // Plyers moves
    var xTurn: Array<Int> = []
    var oTurn: Array<Int> = []
    
    // GAME_STATES
    let GAME_CONTINUE = -1
    let GAME_DRAW = 0
    let PLAYER_X_WON = 1
    let PLAYER_O_WON = 2

    var board = 0
    
    // Add move to Player Array
    func addMove(tag: Int)  {
        if !fullBoard() {
            if currentTurn == true {
                xTurn.append(tag)
                currentTurn = false
            } else {
                oTurn.append(tag)
                currentTurn = true
            }
            
            board += 1
            
            if board > 4 {
                _ = checkWinner()
            }
        }
        gameStarted = true
    }
    
    // Check if board is full
    func fullBoard() -> Bool {
        if board > 8 {
            return true
        }
        return false
    }
    
    // Check winner
    func checkWinner() -> Int {
        if !fullBoard() && GAME_CONTINUE == -1 {
            // X Win conditions
            if winConditions[0].allSatisfy({xTurn.contains($0)}) ||
                winConditions[1].allSatisfy({xTurn.contains($0)}) ||
                winConditions[2].allSatisfy({xTurn.contains($0)}) ||
                winConditions[3].allSatisfy({xTurn.contains($0)}) ||
                winConditions[4].allSatisfy({xTurn.contains($0)}) ||
                winConditions[5].allSatisfy({xTurn.contains($0)}) ||
                winConditions[6].allSatisfy({xTurn.contains($0)}) ||
                winConditions[7].allSatisfy({xTurn.contains($0)}) {
                return PLAYER_X_WON
            }
            
            // O Win conditions
            else if winConditions[0].allSatisfy({oTurn.contains($0)}) ||
                        winConditions[1].allSatisfy({oTurn.contains($0)}) ||
                        winConditions[2].allSatisfy({oTurn.contains($0)}) ||
                        winConditions[3].allSatisfy({oTurn.contains($0)}) ||
                        winConditions[4].allSatisfy({oTurn.contains($0)}) ||
                        winConditions[5].allSatisfy({oTurn.contains($0)}) ||
                        winConditions[6].allSatisfy({oTurn.contains($0)}) ||
                        winConditions[7].allSatisfy({oTurn.contains($0)}) {
                return PLAYER_O_WON
            }
            // No winner && continue
            else {
                return GAME_CONTINUE
            }
            // Draw
        } else {
            return GAME_DRAW
        }
    }
    
    // Reset Board
    func resetBoard() {
        xTurn = []
        oTurn = []
        board = 0
        gameStarted = false
    }
    
}

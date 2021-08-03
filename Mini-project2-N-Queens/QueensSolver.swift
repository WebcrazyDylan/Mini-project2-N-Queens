//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var countFor1 = 0
var numOfRecursionFor1 = 0
func solveQueens8_1(board: inout Board) {
    solveHelper1(board: &board, row: 0)
    print("(... \(countFor1) possible ways)")
    print("Number of recursive calls: \(numOfRecursionFor1)")
}

/// for 1 : Print all possible ways to place 8 queens on 8x8 chessboard.
func solveHelper1(board: inout Board, row: Int) {
    // base case
    if row == 8 {
        print(board.description)
        countFor1 += 1
    }
    for i in 0...7 {

        if board.isSafe(row: row, col: i) {
            board.place(row: row, col: i)
            solveHelper1(board: &board, row: row + 1)
            numOfRecursionFor1 += 1
            // when the choice does not lead to the right answer
            // delete and try another column
            board.remove(row: row, col: i)
        }
    }
}



/// for 2 : Print the first possible way to place 8 queens on the 8x8 board with
/// less than 115 recursive calls.
/// Stop immediately as soon as you find the first solution.
var countFor2 = 0
var numOfRecursionFor2 = 0
func solveQueens8_2(board: inout Board) {
    solveHelper2(board: &board, row: 0)
    print("(... \(countFor2) possible ways)")
}

func solveHelper2(board: inout Board, row: Int) {
    // base case
    if row == 8 {
        print(board.description)
        countFor2 += 1
        print("Number of recursive calls: \(numOfRecursionFor2)")
        exit(0)
    }
    for i in 0...7 {
        // with this "row % 2" condition -> 48 recursive calls
        // without this "row % 2" condition -> 105 recursive calls
        if row % 2 == 0 {
            if board.isSafe(row: row, col: i) {
                board.place(row: row, col: i)

                if numOfRecursionFor2 < 112 {
                    solveHelper2(board: &board, row: row + 1)
                    numOfRecursionFor2 += 1
                } else {
                    return
                }
                // when the choice does not lead to the right answer
                // delete and try another column
                board.remove(row: row, col: i)
            }
        } else {
            if board.isSafe(row: row, col: 7 - i) {
                board.place(row: row, col: 7 - i)

                if numOfRecursionFor2 < 115 {
                    solveHelper2(board: &board, row: row + 1)
                    numOfRecursionFor2 += 1
                } else {
                    return
                }
                // when the choice does not lead to the right answer
                // delete and try another column
                board.remove(row: row, col: 7 - i)
            }
        }

    }
}


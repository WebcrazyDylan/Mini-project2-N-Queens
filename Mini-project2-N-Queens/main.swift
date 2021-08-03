//
//  main.swift
//  Mini-project2-N-Queens
//
//  Created by Dylan Park on 2021-08-03.
//

import Foundation

var newBoard = Board(size: 8)

print("1. Print all possible ways to place 8 queens on 8x8 chessboard.")
solveQueens8_1(board: &newBoard)
print()
print("2. Print the first possible way to place 8 queens on the 8x8 board with less than 115 recursive calls.  Stop immediately as soon as you find the first solution.")
solveQueens8_2(board: &newBoard)


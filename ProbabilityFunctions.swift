//
//  ProbabilityFunctions.swift
//  CatanProbabilityCalc
//
//  Created by Frederik Lohner on 29/Nov/15.
//  Copyright © 2015 FredLoh. All rights reserved.
//

import Foundation

func getProbabilityByTileType(arrayOfTiles: [Tile]) -> Int {
    return 0
}

func calculateProbabilityForTrifecta(firstTile: TileView, secondTile: TileView,
    thirdTile: TileView) -> Int {
        return getProbability(Int(firstTile.probText.text!)) +
            getProbability(Int(secondTile.probText.text!)) +
            getProbability(Int(thirdTile.probText.text!))
}

func getProbability(inputNumber: Int?) -> Int {
    guard let number = inputNumber else {
        return 0
    }
    switch number {
    case 2, 12:
        return 1
    case 3, 11:
        return 2
    case 4, 10:
        return 3
    case 5, 9:
        return 4
    case 6, 8:
        return 5
    default:
        return 0
    }
}
func getTotalTileTypeProbability(board: [Tile], tileType: TileType) -> Int {
    var clayProbability = 0
    for tile in board {
        if tile.tileType == tileType {
            clayProbability += getProbability(tile.tileProbability)
        }
    }
    return clayProbability
}

func calculateProbabilityFromBoard() -> [Int] {
    var probArray = [Int]()

    for trifecta in arrayOfTrifectas {
        let tile0 = trifecta.square0
        let tile1 = trifecta.square1
        let tile2 = trifecta.square2
        probArray.append(calculateProbabilityForTrifecta(tile0!,
                            secondTile: tile1!, thirdTile: tile2!))
    }
    return probArray
}

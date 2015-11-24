//
//  ProbabilityFunctions.swift
//  CatanProbabilityCalc
//
//  Created by Frederik Lohner on 29/Nov/15.
//  Copyright © 2015 FredLoh. All rights reserved.
//

import Foundation

/*  Given the following board returns list of probabilities per tile type
Clay: 5,11,8,9,8,7,9   Forest: 10,2,7,12,10,7  Sheep: 7,8,3,2,12,11
Stone: 7,8,2,6,8,3     Wheat: 2,9,11,2,10,9
*/
func getProbabilityByTileType(arrayOfTiles: [Tile]) -> Int {
    return 0
}

func calculateProbabilityForTrifecta(firstTile: Tile = defaultTile, secondTile: Tile = defaultTile,
    thirdTile: Tile = defaultTile)->Int {

     return getProbability(firstTile.tileProbability) +
            getProbability(secondTile.tileProbability) +
            getProbability(thirdTile.tileProbability)
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
func getTotalTileTypeProbability(board: [Tile], tileType: TileType)->Int {
    var clayProbability = 0
    for tile in board {
        if tile.tileType == tileType {
            clayProbability += getProbability(tile.tileProbability)
        }
    }
    return clayProbability
}

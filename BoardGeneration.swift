//
//  BoardGeneration.swift
//  CatanProbabilityCalc
//
//  Created by Frederik Lohner on 29/Nov/15.
//  Copyright © 2015 FredLoh. All rights reserved.
//

import Foundation


func generateTileCountBasedOnPlayers(players: Int)->Int {
    switch players {
    case 3, 4:
        return 19
    case 5:
        return 25
    case 6:
        return 30
    default:
        return 0
    }
}


/*  Given the following board returns list of probabilities per tile type
Clay: 5,11,8,9,8,7,9   Wood: 10,2,7,12,10,7  Sheep: 7,8,3,2,12,11
Stone: 7,8,2,6,8,3     Wheat: 2,9,11,2,10,9
*/
func generateTestBoard(tileCount: Int)->[Tile] {
    var testBoard = [Tile]()

    if tileCount == 0 {
        return testBoard
    }
    var onlyOneDesert: UInt32 = 6

    for _ in 0...tileCount-1 {
        let randomProbabilityVal = Int(arc4random() % 11 + 2)
        let randomTileTypeVal = Int(arc4random() % onlyOneDesert)

        var newTileType: TileType = .Desert
        switch randomTileTypeVal {
        case 0:
            newTileType = .Clay
        case 1:
            newTileType = .Wood
        case 2:
            newTileType = .Stone
        case 3:
            newTileType = .Sheep
        case 4:
            newTileType = .Wheat
        default:
            newTileType = .Desert
        }
        if newTileType == .Desert {
            onlyOneDesert--
        }
        let newTile = Tile(tileType: newTileType, tileProbability: Int(randomProbabilityVal))
        testBoard.append(newTile)
    }
    return testBoard
}

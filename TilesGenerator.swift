//
//  TilesGenerator.swift
//  CatanProbabilityCalc
//
//  Created by Frederik Lohner on 2/Dec/15.
//  Copyright © 2015 FredLoh. All rights reserved.
//

import Foundation
import SnapKit

func generateTiles(superView: UIView) {
    let squareSize = 100
    let offset = 1
    //Top 3
    let tile0 = TileView()
    let tile1 = TileView()
    let tile2 = TileView()
    //Second Row 4
    let tile3 = TileView()
    let tile4 = TileView()
    let tile5 = TileView()
    let tile6 = TileView()
    //Third Row 5
    let tile7 = TileView()
    let tile8 = TileView()
    let tile9 = TileView()
    let tile10 = TileView()
    let tile11 = TileView()
    //Fourth Row 4
    let tile12 = TileView()
    let tile13 = TileView()
    let tile14 = TileView()
    let tile15 = TileView()
    //Bottom 3
    let tile16 = TileView()
    let tile17 = TileView()
    let tile18 = TileView()

    tileViewArray = [tile0, tile1, tile2, tile3, tile4,
                     tile5, tile6, tile7, tile8, tile9,
                     tile10, tile11, tile12, tile13,
                    tile14, tile15, tile16, tile17, tile18]

    superView.addSubview(tile0)
    superView.addSubview(tile1)
    superView.addSubview(tile2)
    superView.addSubview(tile3)
    superView.addSubview(tile4)
    superView.addSubview(tile5)
    superView.addSubview(tile6)
    superView.addSubview(tile7)
    superView.addSubview(tile8)
    superView.addSubview(tile9)
    superView.addSubview(tile10)
    superView.addSubview(tile11)
    superView.addSubview(tile12)
    superView.addSubview(tile13)
    superView.addSubview(tile14)
    superView.addSubview(tile15)
    superView.addSubview(tile16)
    superView.addSubview(tile17)
    superView.addSubview(tile18)

    tile0.snp_makeConstraints { (make) -> Void in
        make.right.equalTo(tile1.snp_left).offset(-offset)
        make.top.equalTo(superView)
        make.height.width.equalTo(squareSize)
    }
    tile1.snp_makeConstraints { (make) -> Void in
        make.top.equalTo(tile0)
        make.centerX.equalTo(superView)
        make.height.width.equalTo(squareSize)
    }
    tile2.snp_makeConstraints { (make) -> Void in
        make.top.equalTo(tile0)
        make.left.equalTo(tile1.snp_right).offset(offset)
        make.height.width.equalTo(squareSize)
    }
    //Second Row Constraints
    tile3.snp_makeConstraints { (make) -> Void in
        make.right.equalTo(tile4.snp_left).offset(-offset)
        make.top.equalTo(tile0.snp_bottom).offset(offset)
        make.height.width.equalTo(squareSize)
    }
    tile4.snp_makeConstraints { (make) -> Void in
        make.centerX.equalTo(tile1.snp_left).offset(-offset)
        make.top.equalTo(tile0.snp_bottom).offset(offset)
        make.height.width.equalTo(squareSize)
    }
    tile5.snp_makeConstraints { (make) -> Void in
        make.centerX.equalTo(tile1.snp_right).offset(offset)
        make.top.equalTo(tile0.snp_bottom).offset(offset)
        make.height.width.equalTo(squareSize)
    }
    tile6.snp_makeConstraints { (make) -> Void in
        make.left.equalTo(tile5.snp_right).offset(offset)
        make.top.equalTo(tile0.snp_bottom).offset(offset)
        make.height.width.equalTo(squareSize)
    }
    //Third Row Constraints
    tile7.snp_makeConstraints { (make) -> Void in
        make.right.equalTo(tile8.snp_left).offset(-offset)
        make.top.equalTo(tile3.snp_bottom).offset(offset)
        make.height.width.equalTo(squareSize)
    }
    tile8.snp_makeConstraints { (make) -> Void in
        make.right.equalTo(tile9.snp_left).offset(-offset)
        make.top.equalTo(tile3.snp_bottom).offset(offset)
        make.height.width.equalTo(squareSize)
    }
    tile9.snp_makeConstraints { (make) -> Void in
        make.centerX.equalTo(tile1)
        make.top.equalTo(tile3.snp_bottom).offset(offset)
        make.height.width.equalTo(squareSize)
    }
    tile10.snp_makeConstraints { (make) -> Void in
        make.left.equalTo(tile9.snp_right).offset(offset)
        make.top.equalTo(tile3.snp_bottom).offset(offset)
        make.height.width.equalTo(squareSize)
    }
    tile11.snp_makeConstraints { (make) -> Void in
        make.left.equalTo(tile10.snp_right).offset(offset)
        make.top.equalTo(tile3.snp_bottom).offset(offset)
        make.height.width.equalTo(squareSize)
    }
    //Fourth Row Constraints
    tile12.snp_makeConstraints { (make) -> Void in
        make.right.equalTo(tile13.snp_left).offset(-offset)
        make.top.equalTo(tile7.snp_bottom).offset(offset)
        make.height.width.equalTo(squareSize)
    }
    tile13.snp_makeConstraints { (make) -> Void in
        make.centerX.equalTo(tile1.snp_left).offset(-offset)
        make.top.equalTo(tile7.snp_bottom).offset(offset)
        make.height.width.equalTo(squareSize)
    }
    tile14.snp_makeConstraints { (make) -> Void in
        make.centerX.equalTo(tile1.snp_right).offset(offset)
        make.top.equalTo(tile7.snp_bottom).offset(offset)
        make.height.width.equalTo(squareSize)
    }
    tile15.snp_makeConstraints { (make) -> Void in
        make.left.equalTo(tile14.snp_right).offset(offset)
        make.top.equalTo(tile7.snp_bottom).offset(offset)
        make.height.width.equalTo(squareSize)
    }
    //Bottom row
    tile16.snp_makeConstraints { (make) -> Void in
        make.right.equalTo(tile17.snp_left).offset(-offset)
        make.top.equalTo(tile12.snp_bottom).offset(offset)
        make.height.width.equalTo(squareSize)
    }
    tile17.snp_makeConstraints { (make) -> Void in
        make.top.equalTo(tile12.snp_bottom).offset(offset)
        make.centerX.equalTo(tile1)
        make.height.width.equalTo(squareSize)
    }
    tile18.snp_makeConstraints { (make) -> Void in
        make.top.equalTo(tile12.snp_bottom).offset(offset)
        make.left.equalTo(tile17.snp_right).offset(offset)
        make.height.width.equalTo(squareSize)
    }


    superView.snp_updateConstraints { (make) -> Void in
        make.bottom.equalTo(tile18.snp_bottom).offset(20)
    }
}

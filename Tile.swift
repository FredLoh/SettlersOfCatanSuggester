//
//  Tile.swift
//  CatanProbabilityCalc
//
//  Created by Frederik Lohner on 2/Dec/15.
//  Copyright © 2015 FredLoh. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework
import SnapKit
class TileView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        didLoad()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }

    func didLoad() {
        //Place your initialization code here
        self.backgroundColor = tilesArray[colorIndex].tileColor
//        self.layer.cornerRadius = 20.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.blackColor().CGColor
        let gesture = UITapGestureRecognizer(target: self, action: "onTap:")
        self.addGestureRecognizer(gesture)
        self.addSubview(probText)
        probText.text = String(Int(arc4random() % 11 + 2))
        if probText.text == "7" {
            probText.text = "8"
        }
        probText.font = UIFont.systemFontOfSize(50, weight: UIFontWeightRegular)
        probText.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self)
        }
    }

    func onTap(sender: UITapGestureRecognizer) {
        if pickingColors == true {
            self.backgroundColor = nextColor
            probText.textColor = ContrastColorOf(self.backgroundColor!, returnFlat: true)
        } else {
            probText.text = nextProbability
        }
    }
    var probText = UILabel()
    var probability = 0
    var colorIndex = Int(arc4random() % 6)
    var nextColor: UIColor {
        if colorIndex == tilesArray.count-1 {
            colorIndex = 0
        } else {
            colorIndex++
        }
        guard let color = tilesArray[colorIndex].tileColor else {
            return FlatSand()
        }
        return color
    }
    var nextProbability: String {
        if probText.text == "12" {
            probText.text = "2"
        } else {
            probText.text = String(Int(probText.text!)!+1)
            if probText.text == "7" {
                probText.text = "8"
            }
        }
        return probText.text!
    }
}

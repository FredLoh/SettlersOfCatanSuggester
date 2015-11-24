//
//  Shapes.swift
//  CatanProbabilityCalc
//
//  Created by Frederik Lohner on 1/Dec/15.
//  Copyright © 2015 FredLoh. All rights reserved.
//

import Foundation

class Hexagon: UIView {
    override func drawRect(rect: CGRect) {
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(0, 126.06))
        bezierPath.addLineToPoint(CGPointMake(74.07, 0.5))
        bezierPath.addLineToPoint(CGPointMake(222.21, 0.5))
        bezierPath.addLineToPoint(CGPointMake(299.5, 126.06))
        bezierPath.addLineToPoint(CGPointMake(222.21, 264.5))
        bezierPath.addLineToPoint(CGPointMake(74.07, 264.5))
        bezierPath.addLineToPoint(CGPointMake(0, 126.06))
        UIColor.blackColor().setStroke()
        bezierPath.lineWidth = 2
        bezierPath.stroke()


    }
}

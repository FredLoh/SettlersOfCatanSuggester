//
//  ViewController.swift
//  CatanProbabilityCalc
//
//  Created by Frederik Lohner on 29/Nov/15.
//  Copyright © 2015 FredLoh. All rights reserved.
//

import UIKit
import AVFoundation
import SnapKit
import TesseractOCR
import ChameleonFramework

class InitialView: UIViewController, G8TesseractDelegate,
UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    var captureDevice: AVCaptureDevice?
    var imagePicker: UIImagePickerController?
    let line1 = UIView()
    let line2 = UIView()
    let hexagonView = Hexagon()
    let okButton = UIButton()
    let nextButton = UIButton()
    let calcProbButton = UIButton()
    var probArray: [Int]?
    let scrollView = UIScrollView()
    let innerView = UIView()

    func ok() {
        imagePicker = UIImagePickerController()
        imagePicker?.delegate = self
        //        imagePicker!.delegate = self
        imagePicker!.sourceType = .Camera
        presentViewController(imagePicker!, animated: true, completion: nil)
    }

    func scaleImage(image: UIImage, maxDimension: CGFloat) -> UIImage {

        var scaledSize = CGSize(width: maxDimension, height: maxDimension)
        var scaleFactor: CGFloat
        if image.size.width > image.size.height {
            scaleFactor = image.size.height / image.size.width
            scaledSize.width = maxDimension
            scaledSize.height = scaledSize.width * scaleFactor
        } else {
            scaleFactor = image.size.width / image.size.height
            scaledSize.height = maxDimension
            scaledSize.width = scaledSize.height * scaleFactor
        }

        UIGraphicsBeginImageContext(scaledSize)
        image.drawInRect(CGRectMake(0, 0, scaledSize.width, scaledSize.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return scaledImage
    }
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //        line1.backgroundColor = UIColor.redColor()
        //        line2.backgroundColor = UIColor.redColor()
        //        okButton.backgroundColor = UIColor.greenColor()
        //        hexagonView.backgroundColor = UIColor.clearColor()
        //        okButton.setTitle("Ok", forState: UIControlState.Normal)
        //        okButton.addTarget(self, action: "ok",
        //forControlEvents: UIControlEvents.TouchUpInside)
        //        self.view.addSubview(line1)
        //        self.view.addSubview(line2)
        //        self.view.addSubview(okButton)
        //        self.view.addSubview(hexagonView)
        //        line1.snp_makeConstraints { (make) -> Void in
        //            make.top.bottom.equalTo(self.view)
        //            make.width.equalTo(0.5)
        //            make.left.equalTo(self.view.snp_left).offset(40)
        //        }
        //        line2.snp_makeConstraints { (make) -> Void in
        //            make.top.bottom.equalTo(self.view)
        //            make.width.equalTo(0.5)
        //            make.right.equalTo(self.view.snp_right).offset(-40)
        //        }
        //        okButton.snp_makeConstraints { (make) -> Void in
        //            make.width.height.equalTo(100)
        //            make.centerX.equalTo(self.view)
        //            make.bottom.equalTo(self.view.snp_bottom).offset(-30)
        //        }
        //        hexagonView.snp_makeConstraints { (make) -> Void in
        //            make.center.equalTo(self.view)
        //            make.width.equalTo(300)
        //            make.height.equalTo(265)
        //        }
        //        captureSession.sessionPreset = AVCaptureSessionPresetHigh
        //
        //        let devices = AVCaptureDevice.devices()
        //
        //        for device in devices {
        //            if device.hasMediaType(AVMediaTypeVideo) {
        //                if device.position == AVCaptureDevicePosition.Back {
        //                    captureDevice = device as? AVCaptureDevice
        //                    if captureDevice != nil {
        //                        print("Capture device found")
        //                        beginSession()
        //                    }
        //                }
        //            }
        //        }
        //        self.view.addSubview(initialSquare)
        //        initialSquare.snp_makeConstraints { (make) -> Void in
        //            make.center.equalTo(self.view)
        //            make.height.width.equalTo(100)
        //        }
        
        self.view.addSubview(scrollView)
        scrollView.snp_makeConstraints { (make) -> Void in
            make.top.bottom.left.right.equalTo(self.view)
            make.centerX.equalTo(self.view)
        }
        scrollView.addSubview(innerView)
        scrollView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        scrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        innerView.snp_makeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(scrollView)
            make.centerX.equalTo(scrollView)
        }
        tilesArray.append(TileSquare(tileType: .Desert, tileColor: FlatSand(),
            tileProbability: nil))
        tilesArray.append(TileSquare(tileType: .Wood, tileColor: FlatForestGreen(),
            tileProbability: nil))
        tilesArray.append(TileSquare(tileType: .Clay, tileColor: FlatMaroon(),
            tileProbability: nil))
        tilesArray.append(TileSquare(tileType: .Wheat, tileColor: FlatYellow(),
            tileProbability: nil))
        tilesArray.append(TileSquare(tileType: .Stone, tileColor: FlatGray(),
            tileProbability: nil))
        tilesArray.append(TileSquare(tileType: .Sheep, tileColor: FlatGreen(),
            tileProbability: nil))
        scrollView.contentSize = CGSize(width: 1000, height: 1800)
        scrollView.userInteractionEnabled = true
        generateTiles(innerView)
        self.view.addSubview(nextButton)
        self.view.addSubview(calcProbButton)
        nextButton.snp_makeConstraints { (make) -> Void in
            make.right.top.equalTo(self.view)
            make.height.width.equalTo(75)
        }
        calcProbButton.snp_makeConstraints { (make) -> Void in
            make.right.bottom.equalTo(self.view)
            make.height.width.equalTo(75)
        }
        nextButton.setBackgroundImage(UIImage(named: "next"), forState: UIControlState.Normal)
        nextButton.setBackgroundImage(UIImage(named: "next2"), forState: UIControlState.Selected)
        nextButton.addTarget(self, action: "nextPressed",
            forControlEvents: UIControlEvents.TouchUpInside)
        calcProbButton.setBackgroundImage(UIImage(named: "ten"), forState: UIControlState.Normal)
        calcProbButton.addTarget(self, action: "calcProb",
                                forControlEvents: UIControlEvents.TouchUpInside)
        calcProbButton.enabled = false
    }

    func nextPressed() {
        if nextButton.selected == false {
            pickingColors = false
            nextButton.selected = true
        } else {
            typeAndProbTileArray.removeAll()
            for tile in tileViewArray {
                var type = TileType.Desert
                switch tile.colorIndex {
                case 1:
                    type = .Wood
                case 2:
                    type = .Clay
                case 3:
                    type = .Wheat
                case 4:
                    type = .Stone
                case 5:
                    type = .Sheep
                default:
                    type = .Desert
                }
                let prob = Int(tile.probText.text!)
                let newTile = Tile(tileType: type, tileProbability: prob)
                typeAndProbTileArray.append(newTile)
            }
            probArray = calculateProbabilityFromBoard()
            showNextProbability = false
            calcProbButton.enabled = true
            nextButton.enabled = false
        }
    }
    func calcProb() {
        gen(innerView, probArray: &probArray!)
    }
    func gen(innerView: UIView, inout probArray: [Int]) {
        var idx = 0
        let max = probArray.maxElement()
        if max != 0 {
            for (index, element) in probArray.enumerate() {
                if element == max {
                    idx = index
                }
            }
            let newView = CatanHouse()
            newView.backgroundColor = UIColor.clearColor()
            innerView.addSubview(newView)
//            newView.backgroundColor = UIColor.greenColor()
            let sq0 = arrayOfTrifectas[idx].square0
            let sq1 = arrayOfTrifectas[idx].square1
            let sq2 = arrayOfTrifectas[idx].square2
            if sq0?.frame.origin.x < sq1?.frame.origin.x
                && sq0?.frame.origin.y > sq1?.frame.origin.y {
                    newView.snp_makeConstraints(closure: { (make) -> Void in
                        make.height.width.equalTo(20)
                        make.centerX.equalTo(sq0!.snp_right)
                        make.centerY.equalTo(sq1!.snp_bottom)
                    })
            } else if sq0?.frame.origin.x < sq1?.frame.origin.x
                && sq0?.frame.origin.y < sq1?.frame.origin.y {
                    newView.snp_makeConstraints(closure: { (make) -> Void in
                        make.height.width.equalTo(20)
                        make.centerX.equalTo(sq0!.snp_right)
                        make.centerY.equalTo(sq1!.snp_top)
                    })
            }
            probArray[idx] = 0
        } else {
            calcProbButton.enabled = false
        }
    }

    func shouldCancelImageRecognitionForTesseract(tesseract: G8Tesseract!) -> Bool {
        return false; // return true if you need to interrupt tesseract before it finishes
    }
    func beginSession() {
        do {
            let err: NSError? = nil
            try captureSession.addInput(AVCaptureDeviceInput(device: captureDevice))
            if err != nil {
                print("error: \(err?.localizedDescription)")
            }
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            self.view.layer.addSublayer(previewLayer!)
            previewLayer?.frame = self.view.layer.frame
            //            self.view.bringSubviewToFront(line1)
            //            self.view.bringSubviewToFront(line2)
            self.view.bringSubviewToFront(okButton)
            self.view.bringSubviewToFront(hexagonView)
            captureSession.startRunning()
        } catch {
        }
    }
}

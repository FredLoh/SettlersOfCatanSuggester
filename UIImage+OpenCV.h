//
//  UIImage+OpenCV.h
//  CatanProbabilityCalc
//
//  Created by Frederik Lohner on 30/Nov/15.
//  Copyright © 2015 FredLoh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <opencv2/opencv.hpp>

@interface UIImage (OpenCV)

//cv::Mat to UIImage
+ (UIImage *)imageWithCVMat:(const cv::Mat&)cvMat;
- (id)initWithCVMat:(const cv::Mat&)cvMat;

//UIImage to cv::Mat
- (cv::Mat)CVMat;
- (cv::Mat)CVMat3;  // no alpha channel
- (cv::Mat)CVGrayscaleMat;

@end

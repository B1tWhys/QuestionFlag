//
//  ViewController.h
//  Question Flag
//
//  Created by iD Student on 7/16/14.
//  Copyright (c) 2014 SkylerArnold. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Problem.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) NSTimer *arrivalTimer;
@property (strong, nonatomic) NSMutableArray *problemArray;
- (void)addProblemToProblemArray:(Problem *)problem;
@end

@interface UINavigationController (RotationAll)
-(NSUInteger)supportedInterfaceOrientations;
@end
@implementation UINavigationController (RotationAll)
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}
@end

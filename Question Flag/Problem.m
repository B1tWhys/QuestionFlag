//
//  Problem.m
//  Question Flag
//
//  Created by iD Student on 7/16/14.
//  Copyright (c) 2014 SkylerArnold. All rights reserved.
//

#import "Problem.h"
@interface Problem ()
@property (nonatomic, readwrite) int urgency;
@property (nonatomic, readwrite) int estimatedSolveTimeSec;
@end

@implementation Problem
- (instancetype)initWithUrgency:(int)urgency solveTimeInSeconds:(int)solvetime
{
    self = [super init];
    if (self) {
        self.startDate = [NSDate date];
        //self.arrivalDate = [[NSDate alloc] init];
        self.urgency = urgency;
        self.estimatedSolveTimeSec = solvetime;
    }
    return self;
}
@end

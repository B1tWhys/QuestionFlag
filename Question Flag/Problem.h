//
//  Problem.h
//  Question Flag
//
//  Created by iD Student on 7/16/14.
//  Copyright (c) 2014 SkylerArnold. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Problem : NSObject
@property (nonatomic, readonly) int urgency;
@property (nonatomic, readonly) int estimatedSolveTimeSec;
@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSDate *arrivalDate;
- (instancetype)initWithUrgency:(int)urgency solveTimeInSeconds:(int)solveTime;
@end

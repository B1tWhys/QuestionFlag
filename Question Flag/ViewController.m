//
//  ViewController.m
//  Question Flag
//
//  Created by iD Student on 7/16/14.
//  Copyright (c) 2014 SkylerArnold. All rights reserved.
//

#import "ViewController.h"
#import "ProblemSetupViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *problemUrgencyLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfProblems;
@property (weak, nonatomic) IBOutlet UILabel *solveTimeLabel;
@property (nonatomic) BOOL testMode;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.testMode = YES;
    
    self.numberOfProblems.text = @"Number of Problems: 99";
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)addProblemToProblemArray:(Problem *)problem
{
    if (self.problemArray == nil) self.problemArray = [[NSMutableArray alloc] init];
    [self.problemArray addObject:problem];
    [self.arrivalTimer invalidate];
    [self updateUI];
}

- (void)updateUI
{
    Problem *problem = [self.problemArray lastObject];
    self.arrivalTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector: NSSelectorFromString(@"fireTimer") userInfo:nil repeats:YES];
    int problemUrgency = ((Problem *)(self.problemArray.lastObject)).urgency;
    self.problemUrgencyLabel.text = [NSString stringWithFormat:@"Urgency: %i", problemUrgency];
    self.numberOfProblems.text = [NSString stringWithFormat:@"Number of Problems: %lu", (unsigned long)[self.problemArray count]];
    self.solveTimeLabel.text = [NSString stringWithFormat:@"Solve Time: %@", [ViewController formatSecondsToColonNotation:problem.estimatedSolveTimeSec]];
    if (self.testMode == YES)
    {
         self.view.backgroundColor = [UIColor colorWithRed:(122.0/255.0) green:(240.0/255.0) blue:(255.0/255.0) alpha:1.0];
    } else {
        switch (problemUrgency) {
            case 1:
                self.view.backgroundColor = [UIColor greenColor];
                break;
            case 2:
                self.view.backgroundColor = [UIColor yellowColor];
                break;
            case 3:
                self.view.backgroundColor = [UIColor redColor];
                break;
            default:
                self.view.backgroundColor = [UIColor blackColor];
                break;
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    self.navigationController.navigationBarHidden = NO;
}

- (IBAction)cancelProblem:(id)sender
{
    self.timerLabel.text = @"00:00";
    [self.problemArray removeLastObject];
    self.problemUrgencyLabel.text = @"Urgency: 0";
    self.solveTimeLabel.text = @"Estimated Solve Time: 00:00";
    self.numberOfProblems.text = @"Number of Problems: 99";
    self.view.backgroundColor = [UIColor whiteColor];
}

+ (NSString *)formatSecondsToColonNotation:(int)seconds
{
    int min = (int)(seconds / 60);
    int sec = (seconds % 60);
    NSString *minStr;
    NSString *secStr;
    if (min/10.0 < 1) {
        minStr = [NSString stringWithFormat:@"0%i", min];
    } else {
        minStr = [NSString stringWithFormat:@"%i", min];
    }
    if (sec/10.0 < 1) {
        secStr = [NSString stringWithFormat:@"0%i", sec];
    } else {
        secStr = [NSString stringWithFormat:@"%i", sec];
    }
    return [minStr stringByAppendingString:[@":" stringByAppendingString:secStr]];
}

- (void)fireTimer
{
    self.timerLabel.text = [ViewController formatSecondsToColonNotation:-[((Problem *)self.problemArray[0]).startDate timeIntervalSinceNow]];
}

- (IBAction)instructorArrived:(id)sender
{
    [self.arrivalTimer invalidate];
    self.timerLabel.text = @"00:00";
    Problem *p = self.problemArray[0];
    p.arrivalDate = [NSDate date];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[[NSArray arrayWithArray:[userDefaults arrayForKey:@"arrivalTimeArray"]] arrayByAddingObject:[NSNumber numberWithInteger:-[((Problem *)[self.problemArray lastObject]).startDate timeIntervalSinceNow]]] forKey:@"arrivalTimeArray"];
    [userDefaults synchronize];
}

- (IBAction)problemSolved:(id)sender
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[[NSArray arrayWithArray:[userDefaults arrayForKey:@"solveTimeArray"]] arrayByAddingObject:[NSNumber numberWithInteger:-[((Problem *)[self.problemArray[0] lastObject]).arrivalDate timeIntervalSinceNow]]] forKey:@"solveTimeArray"];
}

@end

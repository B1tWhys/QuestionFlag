//
//  ProblemSetupViewController.m
//  Question Flag
//
//  Created by iD Student on 7/16/14.
//  Copyright (c) 2014 SkylerArnold. All rights reserved.
//

#import "ProblemSetupViewController.h"
#import "ViewController.h"
#import "Problem.h"

@interface ProblemSetupViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *urgencyPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *solveTimePicker;
@property (strong, nonatomic) NSArray *urgencyOptions;
@end

@implementation ProblemSetupViewController
- (IBAction)createProblem:(id)sender
{
    int predictedNumberOfSeconds =((int)[self.solveTimePicker selectedRowInComponent:0] * 60) + ((int)[self.solveTimePicker selectedRowInComponent:1]);
    int problemUrgency = 3 - (int)[self.urgencyPicker selectedRowInComponent:0];
    Problem *problem = [[Problem alloc] initWithUrgency: problemUrgency solveTimeInSeconds: predictedNumberOfSeconds];
    ViewController *topViewController = (ViewController *)(self.navigationController.viewControllers[0]);
    [topViewController addProblemToProblemArray:problem];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (BOOL)jayZ
{
    NSMutableArray *nintyNineProblems = [[NSMutableArray alloc]init];
    if ([nintyNineProblems containsObject:@"bitch"]) {
        return NO;
    } else {
        return YES;
    }
    
    for (int i = 0; i < 99; i ++) {
        [nintyNineProblems addObject:[[Problem alloc] init]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self jayZ];
    self.urgencyPicker.delegate = self;
    self.urgencyPicker.dataSource = self;
    self.solveTimePicker.delegate = self;
    self.solveTimePicker.dataSource = self;
    self.urgencyOptions = @[@"VERY URGENT", @"Pretty Urgent", @"low priority"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.urgencyPicker selectRow:1 inComponent:0 animated:NO];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    int components;
    components = pickerView == self.urgencyPicker ? 1 : 2;
    return components;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    int rows;
    rows = pickerView.numberOfComponents == 1 ? (int)[self.urgencyOptions count] : 60;
    return rows;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSMutableArray *range = [[NSMutableArray alloc] init];
    if (pickerView == self.urgencyPicker) {
        return (NSString *)self.urgencyOptions[row];
    } else if (pickerView == self.solveTimePicker || component == 0) {
        for (int i = 0; (i < 60); i ++) {
            [range addObject:[NSNumber numberWithInt: i]];
        }
    } else {
        for (int i = 0; (i < 12); i += 5) {
            [range addObject:[NSNumber numberWithInt: i]];
        }
    }
        return [((NSNumber *)range[row]) stringValue];
}

@end

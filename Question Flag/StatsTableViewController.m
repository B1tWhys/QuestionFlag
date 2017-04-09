//
//  StatsTableViewController.m
//  Question Flag
//
//  Created by iD Student on 7/18/14.
//  Copyright (c) 2014 SkylerArnold. All rights reserved.
//

#import "StatsTableViewController.h"
#import "StatsCell.h"

@interface StatsTableViewController ()
@property (nonatomic, strong) NSArray *statSuperArray;
@end

@implementation StatsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.statSuperArray = @[[[NSUserDefaults standardUserDefaults] arrayForKey:@"solveTimeArray"], [[NSUserDefaults standardUserDefaults] arrayForKey:@"solveTimeArray"]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    int rowCount = 0;
//    for (NSArray *subArray in self.statSuperArray) {
//        for (id i in subArray) {
//            id x = i;
//            x = x;
//            rowCount ++;
//        }
//    }
    int rowCount = [self.statSuperArray count];
    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"statsCell" forIndexPath:indexPath];
    NSNumber *sum;
    int count = 0;
    float average;
    NSArray *dunno = (NSArray *)(self.statSuperArray[[indexPath row]]);
    for (NSNumber *item in dunno) {
        sum = [NSNumber numberWithInt:([item integerValue] + [sum integerValue])];
        count ++;
    }
    
    average = [sum floatValue] / (float)count;
    cell.titleLabel.text = @"average response time";
    cell.dataLabel.text = [NSString stringWithFormat:@"%f", average];
    return cell;
}

@end

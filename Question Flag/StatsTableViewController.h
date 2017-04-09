//
//  StatsTableViewController.h
//  Question Flag
//
//  Created by iD Student on 7/18/14.
//  Copyright (c) 2014 SkylerArnold. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatsTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *statLabel;
@end

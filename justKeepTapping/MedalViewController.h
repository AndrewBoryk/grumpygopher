//
//  MedalViewController.h
//  justKeepTapping
//
//  Created by Andrew Boryk on 1/26/15.
//  Copyright (c) 2015 Andrew Boryk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mainTableButton.h"
@interface MedalViewController : UITableViewController

//Properties
@property (strong, nonatomic) IBOutlet UITableView *backButton;
@property (strong, nonatomic) IBOutlet UIButton *gophersWacked;

//Variables
@property NSArray *goalArray;
@end

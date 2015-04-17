//
//  HowToViewController.h
//  justKeepTapping
//
//  Created by Andrew Boryk on 1/25/15.
//  Copyright (c) 2015 Andrew Boryk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HowToViewController : UIViewController

//Variables
@property NSMutableArray *boxArray;
@property int rand;

//Other Properties
@property (strong, nonatomic) IBOutlet UIImageView *backgroundGrass;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UILabel *one;
@property (strong, nonatomic) IBOutlet UILabel *two;
@property (strong, nonatomic) IBOutlet UILabel *three;
@property (strong, nonatomic) IBOutlet UIButton *playButton;

//Other Actions
- (IBAction)backAction:(id)sender;

//Box Properties
@property (strong, nonatomic) IBOutlet UIButton *box1;
@property (strong, nonatomic) IBOutlet UIButton *box2;
@property (strong, nonatomic) IBOutlet UIButton *box3;
@property (strong, nonatomic) IBOutlet UIButton *box4;
@property (strong, nonatomic) IBOutlet UIButton *box5;
@property (strong, nonatomic) IBOutlet UIButton *box6;
@property (strong, nonatomic) IBOutlet UIButton *box7;
@property (strong, nonatomic) IBOutlet UIButton *box8;
@property (strong, nonatomic) IBOutlet UIButton *box9;
@property (strong, nonatomic) IBOutlet UIButton *box10;
@property (strong, nonatomic) IBOutlet UIButton *box11;
@property (strong, nonatomic) IBOutlet UIButton *box12;
@property (strong, nonatomic) IBOutlet UIButton *box13;
@property (strong, nonatomic) IBOutlet UIButton *box14;
@property (strong, nonatomic) IBOutlet UIButton *box15;
@property (strong, nonatomic) IBOutlet UIButton *box16;

//Box Actions
- (IBAction)action1:(id)sender;
- (IBAction)action2:(id)sender;
- (IBAction)action3:(id)sender;
- (IBAction)action4:(id)sender;
- (IBAction)action5:(id)sender;
- (IBAction)action6:(id)sender;
- (IBAction)action7:(id)sender;
- (IBAction)action8:(id)sender;
- (IBAction)action9:(id)sender;
- (IBAction)action10:(id)sender;
- (IBAction)action11:(id)sender;
- (IBAction)action12:(id)sender;
- (IBAction)action13:(id)sender;
- (IBAction)action14:(id)sender;
- (IBAction)action15:(id)sender;
- (IBAction)action16:(id)sender;
@end

//
//  ViewController.h
//  justKeepTapping
//
//  Created by Andrew Boryk on 12/8/14.
//  Copyright (c) 2014 Andrew Boryk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h> 
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>
//#import "GAITrackedViewController.h"
//#import "GAI.h"

@interface ViewController : UIViewController <ADBannerViewDelegate>
{
    SystemSoundID popSound;
    SystemSoundID loseSound;
    SystemSoundID oPopSound;
}

//Variables
@property int time;
@property int defuses;
@property NSMutableArray *boxArray;
@property int rand;
@property BOOL gameOver;
@property float speed;
@property NSUserDefaults *defaults;
@property float viewHeight;
@property float viewWidth;


//SunMoon Variables
@property (strong, nonatomic) IBOutlet UIImageView *sunMoon;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topSun;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *rightSun;
@property (strong, nonatomic) IBOutlet UIImageView *nightGrass;

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

//End Properties
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *endCenterY;
@property (strong, nonatomic) IBOutlet UILabel *medalLabel;
@property (strong, nonatomic) IBOutlet UIImageView *medal;
@property (strong, nonatomic) IBOutlet UILabel *scoreLab;
@property (strong, nonatomic) IBOutlet UILabel *endScore;
@property (strong, nonatomic) IBOutlet UILabel *bestLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *medWidth;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *medHeight;
@property (strong, nonatomic) IBOutlet UILabel *bestScore;
@property (strong, nonatomic) IBOutlet UIView *endView;
@property (strong, nonatomic) IBOutlet UIButton *shareButton;


//Other Actions
- (IBAction)startAction:(id)sender;
- (IBAction)backAction:(id)sender;
- (IBAction)shareAction:(id)sender;

//Other Properties
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UIButton *sky;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *highScore;
@property (strong, nonatomic) IBOutlet ADBannerView *iAds;
@property (strong, nonatomic) IBOutlet GADBannerView *bannerAdMob;
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UIButton *howToButton;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundGrass;
@property (strong, nonatomic) IBOutlet UIImageView *gopherHome;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIImageView *gover;

@end


//
//  HomeViewController.h
//  justKeepTapping
//
//  Created by Andrew Boryk on 1/25/15.
//  Copyright (c) 2015 Andrew Boryk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import "GameKitHelper.h"

@interface HomeViewController : UIViewController <GKGameCenterControllerDelegate>


@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UIButton *howToButton;
@property (strong, nonatomic) IBOutlet UIButton *achieveButton;
@property (strong, nonatomic) IBOutlet UIImageView *gopherHome;
@property NSString *leaderboardIdentifier;
@property BOOL gameCenterEnabled;
@property NSUserDefaults *defaults;
- (IBAction)showLeaderboard:(id)sender;

@end

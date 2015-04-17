//
//  HomeViewController.m
//  justKeepTapping
//
//  Created by Andrew Boryk on 1/25/15.
//  Copyright (c) 2015 Andrew Boryk. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

NSTimer *waitTimer;
NSUserDefaults *defaults;
@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    defaults = [NSUserDefaults standardUserDefaults];
    [self.playButton.titleLabel setFont:[UIFont fontWithName:@"8BITWONDERNominal" size:25]];
    [self.howToButton.titleLabel setFont:[UIFont fontWithName:@"8BITWONDERNominal" size:21]];
    [self.achieveButton.titleLabel setFont:[UIFont fontWithName:@"8BITWONDERNominal" size:21]];
    if ([defaults objectForKey:@"goals"]) {
        NSNumber *high = [NSNumber numberWithInteger:[defaults integerForKey:@"highScoreDefuses"] ];
        NSNumber *wackNum = [NSNumber numberWithInt:[[defaults objectForKey:@"wacks"] intValue]];
        NSMutableArray *goalArray = [[defaults objectForKey:@"goals"] mutableCopy];
        NSLog(@"Wacks: %@", wackNum);
        if ([[[goalArray objectAtIndex:0] objectForKey:@"Done"] isEqualToString:@"No"] && [high intValue] >=100) {
            [self goalChecker:0];
        }
        if ([[[goalArray objectAtIndex:1] objectForKey:@"Done"] isEqualToString:@"No"] && [high intValue] >=225) {
            [self goalChecker:1];
        }
        if ([[[goalArray objectAtIndex:2] objectForKey:@"Done"] isEqualToString:@"No"] && [high intValue] >=350) {
            [self goalChecker:2];
        }
        if ([[[goalArray objectAtIndex:3] objectForKey:@"Done"] isEqualToString:@"No"] && [wackNum intValue] >=1000) {
            [self goalChecker:3];
        }
        if ([[[goalArray objectAtIndex:4] objectForKey:@"Done"] isEqualToString:@"No"] && [wackNum intValue] >=5000) {
            [self goalChecker:4];
        }
        if ([[[goalArray objectAtIndex:5] objectForKey:@"Done"] isEqualToString:@"No"] && [wackNum intValue] >=10000) {
            [self goalChecker:5];
        }
        if ([[[goalArray objectAtIndex:6] objectForKey:@"Done"] isEqualToString:@"No"] && [wackNum intValue] >=50000) {
            [self goalChecker:6];
        }
        if ([[[goalArray objectAtIndex:7] objectForKey:@"Done"] isEqualToString:@"No"] && [wackNum intValue] >=100000) {
            [self goalChecker:7];
        }
    }
    else{
        NSNumber *wacks = [NSNumber numberWithInt:0];
        NSDictionary *bronzeGoal = [NSDictionary dictionaryWithObjectsAndKeys:@"Bronze Medal", @"Title", @"Reach a score of 100", @"Subtitle", @"bronzeSmall", @"Icon", @"No", @"Done", nil];
        NSDictionary *silverGoal = [NSDictionary dictionaryWithObjectsAndKeys:@"Silver Medal", @"Title", @"Reach a score of 225", @"Subtitle", @"silverSmall", @"Icon", @"No", @"Done", nil];
        NSDictionary *goldGoal = [NSDictionary dictionaryWithObjectsAndKeys:@"Gold Medal", @"Title", @"Reach a score of 350", @"Subtitle", @"goldSmall", @"Icon", @"No", @"Done", nil];
        NSDictionary *redGoal = [NSDictionary dictionaryWithObjectsAndKeys:@"Novice", @"Title", @"Whack 1,000 Gophers", @"Subtitle", @"redSmall", @"Icon", @"No", @"Done", nil];
        NSDictionary *blueGoal = [NSDictionary dictionaryWithObjectsAndKeys:@"Average", @"Title", @"Whack 5,000 Gophers", @"Subtitle", @"blueSmall", @"Icon", @"No", @"Done", nil];
        NSDictionary *orangeGoal = [NSDictionary dictionaryWithObjectsAndKeys:@"Pretty Good", @"Title", @"Whack 10,000 Gophers", @"Subtitle", @"orangeSmall", @"Icon", @"No", @"Done", nil];
        NSDictionary *purpleGoal = [NSDictionary dictionaryWithObjectsAndKeys:@"Professional", @"Title", @"Whack 50,000 Gophers", @"Subtitle", @"pinkSmall", @"Icon", @"No", @"Done", nil];
        NSDictionary *emeraldGoal = [NSDictionary dictionaryWithObjectsAndKeys:@"Master", @"Title", @"Whack 100,000 Gophers", @"Subtitle", @"purpleSmall", @"Icon", @"No", @"Done", nil];
        [defaults setObject:[NSArray arrayWithObjects:bronzeGoal, silverGoal, goldGoal,redGoal, blueGoal, orangeGoal,purpleGoal,emeraldGoal, nil] forKey:@"goals"];
        [defaults setObject:wacks forKey:@"wacks"];
        [defaults synchronize];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    waitTimer = [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(goPher) userInfo:nil repeats:YES];
}

-(void)goPher{
    int randy = arc4random_uniform(5);
    NSMutableArray *images;
    switch (randy) {
        case 0:
            images = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"empty"], [UIImage imageNamed:@"grumpy1"], [UIImage imageNamed:@"grumpy1"], [UIImage imageNamed:@"empty"], nil];
            break;
        case 1:
            images = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"empty"], [UIImage imageNamed:@"grumpy1"], [UIImage imageNamed:@"grumpy2"], [UIImage imageNamed:@"grumpy2"], [UIImage imageNamed:@"grumpy1"], [UIImage imageNamed:@"empty"], nil];
            break;
        case 2:
            images = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"empty"], [UIImage imageNamed:@"grumpy1"], [UIImage imageNamed:@"grumpy2"], [UIImage imageNamed:@"grumpy3"], [UIImage imageNamed:@"grumpy3"], [UIImage imageNamed:@"grumpy2"], [UIImage imageNamed:@"grumpy1"], [UIImage imageNamed:@"empty"], nil];
            break;
        case 3:
            images = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"empty"], [UIImage imageNamed:@"grumpy1"], [UIImage imageNamed:@"grumpy2"], [UIImage imageNamed:@"grumpy3"], [UIImage imageNamed:@"grumpy4"], [UIImage imageNamed:@"grumpy4"], [UIImage imageNamed:@"grumpy3"], [UIImage imageNamed:@"grumpy2"], [UIImage imageNamed:@"grumpy1"], [UIImage imageNamed:@"empty"], nil];
            break;
        case 4:
            images = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"empty"], [UIImage imageNamed:@"grumpy1"], [UIImage imageNamed:@"grumpy2"], [UIImage imageNamed:@"grumpy3"], [UIImage imageNamed:@"grumpy4"], [UIImage imageNamed:@"grumpyLast"], [UIImage imageNamed:@"grumpyLast"], [UIImage imageNamed:@"grumpy4"], [UIImage imageNamed:@"grumpy3"], [UIImage imageNamed:@"grumpy2"], [UIImage imageNamed:@"grumpy1"], [UIImage imageNamed:@"empty"], nil];
            break;
        default:
            images = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"empty"], [UIImage imageNamed:@"grumpy1"], [UIImage imageNamed:@"grumpy1"], [UIImage imageNamed:@"empty"], nil];
            break;
    }
    self.gopherHome.animationImages = images;
    self.gopherHome.animationDuration = 1.5f;
    self.gopherHome.animationRepeatCount = 0;
    [self.gopherHome startAnimating];
}

-(void)goalChecker:(int)num{
    NSMutableArray *goalArray = [[defaults objectForKey:@"goals"] mutableCopy];
    NSMutableDictionary *tempDict = [[goalArray objectAtIndex:num] mutableCopy];
    [tempDict setObject:@"Yes" forKey:@"Done"];
    [goalArray setObject:tempDict atIndexedSubscript:num];
    [defaults setObject:goalArray forKey:@"goals"];
    [defaults synchronize];
}
@end

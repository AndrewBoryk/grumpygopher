//
//  ViewController.m
//  justKeepTapping
//
//  Created by Andrew Boryk on 12/8/14.
//  Copyright (c) 2014 Andrew Boryk. All rights reserved.
//

#import "ViewController.h"

//#import "AppDelegate.h"

@interface ViewController ()

@end

NSTimer *boxTimer;
NSTimer *flashingTimer;
NSTimer *restartTimer;
NSTimer *goalTimer;
int flashCounter;
float spacer;
float topSpacer;
int isSun;
UIImage *night;
UIImage *day;
float op;
float opChange;
NSMutableArray *goalArray;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *rightURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Ow" ofType:@"m4a"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) rightURL, &loseSound);
    NSURL *oURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"nPop" ofType:@"m4a"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) oURL, &oPopSound);
    self.defaults = [NSUserDefaults standardUserDefaults];
    goalArray = [[self.defaults objectForKey:@"goals"] mutableCopy];
    UIImage *image = [UIImage imageNamed:@"grassBackground"];
    UIImage *nImage = [UIImage imageNamed:@"nightBackground"];
    [self.endView setAlpha: 0];
    self.startButton.enabled = 0;
    self.shareButton.enabled = 0;
    day = [UIImage imageWithCGImage:[image CGImage] scale:4.0 orientation:image.imageOrientation];
    night = [UIImage imageWithCGImage:[nImage CGImage] scale:4.0 orientation:image.imageOrientation];
    [self.backgroundGrass setBackgroundColor:[UIColor colorWithPatternImage:day]];
    [self.nightGrass setBackgroundColor:[UIColor colorWithPatternImage:night]];
    [self.startButton.titleLabel setFont:[UIFont fontWithName:@"8BITWONDERNominal" size:19]];
    [self.shareButton.titleLabel setFont:[UIFont fontWithName:@"8BITWONDERNominal" size:19]];
    [self.backButton setTitle:@"Main Menu" forState:UIControlStateNormal];
    self.highScore.font = [UIFont fontWithName:@"8BITWONDERNominal" size:15];
    self.scoreLabel.font = [UIFont fontWithName:@"8BITWONDERNominal" size:20];
    [self.backButton.titleLabel setFont: [UIFont fontWithName:@"8BITWONDERNominal" size:25]];
    self.medalLabel.font = [UIFont fontWithName:@"8BITWONDERNominal" size:20];
    self.scoreLab.font = [UIFont fontWithName:@"8BITWONDERNominal" size:20];
    self.bestScore.font = [UIFont fontWithName:@"8BITWONDERNominal" size:25];
    self.bestLabel.font = [UIFont fontWithName:@"8BITWONDERNominal" size:20];
    self.endScore.font = [UIFont fontWithName:@"8BITWONDERNominal" size:25];
    self.gameOver = YES;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: 0"];
    self.speed = 0.75f;
    if (![self.defaults integerForKey:@"highScoreDefuses"]) {
        self.highScore.text = [NSString stringWithFormat:@"High Score: 0"];
        [self.defaults setInteger:0 forKey:@"highScoreDefuses"];
        [self.defaults synchronize];
    }
    else {
        self.highScore.text = [NSString stringWithFormat:@"High Score: %ld", (long)[self.defaults integerForKey:@"highScoreDefuses"]];
    }
    self.iAds.hidden = YES;
    self.bannerAdMob.hidden = YES;
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    self.box1.hidden = 0;
    self.box2.hidden = 0;
    self.box3.hidden = 0;
    self.box4.hidden = 0;
    self.box5.hidden = 0;
    self.box6.hidden = 0;
    self.box7.hidden = 0;
    self.box8.hidden = 0;
    self.box9.hidden = 0;
    self.box10.hidden = 0;
    self.box11.hidden = 0;
    self.box12.hidden = 0;
    self.box13.hidden = 0;
    self.box14.hidden = 0;
    self.box15.hidden = 0;
    self.box16.hidden = 0;
    self.highScore.hidden = 0;
    self.scoreLabel.hidden = 0;
    self.box1.layer.cornerRadius = 2.0f;
    self.box2.layer.cornerRadius = 2.0f;
    self.box3.layer.cornerRadius = 2.0f;
    self.box4.layer.cornerRadius = 2.0f;
    self.box5.layer.cornerRadius = 2.0f;
    self.box6.layer.cornerRadius = 2.0f;
    self.box7.layer.cornerRadius = 2.0f;
    self.box8.layer.cornerRadius = 2.0f;
    self.box9.layer.cornerRadius = 2.0f;
    self.box10.layer.cornerRadius = 2.0f;
    self.box11.layer.cornerRadius = 2.0f;
    self.box12.layer.cornerRadius = 2.0f;
    self.box13.layer.cornerRadius = 2.0f;
    self.box14.layer.cornerRadius = 2.0f;
    self.box15.layer.cornerRadius = 2.0f;
    self.box16.layer.cornerRadius = 2.0f;
    [self.box1 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box2 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box3 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box4 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box5 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box6 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box7 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box8 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box9 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box10 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box11 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box12 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box13 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box14 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box15 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box16 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    self.bannerAdMob.adUnitID = @"ca-app-pub-6233938597693711/6244823983";
    self.bannerAdMob.rootViewController = self;
    GADRequest *request = [GADRequest request];
    // Enable test ads on simulators.
    [self.bannerAdMob loadRequest:request];
    op = 0.52f;
    opChange = 0.02f;
    [self.backgroundGrass setAlpha:op];
    [self.sky setAlpha:op];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.screenName = @"Game Screen";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    isSun = 1;
    spacer = -1*(self.view.bounds.size.width / 43.0f);
    topSpacer = -1*(40.0f/25.0f);
    [self.startButton setTitle:[NSString stringWithFormat:@"Replay"] forState:UIControlStateNormal];
    [self.shareButton setTitle:[NSString stringWithFormat:@"Share"] forState:UIControlStateNormal];
    flashCounter = 0;
    flashingTimer = [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(flashChange) userInfo:nil repeats:YES];
    self.gameOver = NO;
    self.defuses = 0;
    self.time = 0;
    self.speed = 0.50f;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: 0"];
    self.boxArray = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil];
    [self.box1 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box2 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box3 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box4 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box5 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box6 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box7 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box8 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box9 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box10 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box11 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box12 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box13 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box14 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box15 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box16 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    boxTimer = [NSTimer scheduledTimerWithTimeInterval:self.speed target:self selector:@selector(goBombs) userInfo:nil repeats:YES];
    self.iAds.hidden = YES;
    self.bannerAdMob.hidden = YES;
//    NSArray *images = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"empty"], [UIImage imageNamed:@"grumpy1"], [UIImage imageNamed:@"grumpy2"], [UIImage imageNamed:@"grumpy3"], [UIImage imageNamed:@"grumpy4"], [UIImage imageNamed:@"grumpyLast"], [UIImage imageNamed:@"grumpyLast"], [UIImage imageNamed:@"grumpy4"], [UIImage imageNamed:@"grumpy3"], [UIImage imageNamed:@"grumpy2"], [UIImage imageNamed:@"grumpy1"], [UIImage imageNamed:@"empty"], nil];
//    self.gopherHome.animationImages = images;
//    self.gopherHome.animationDuration = 1.5f;
//    self.gopherHome.animationRepeatCount = 0;
//    [self.gopherHome startAnimating];
}

- (IBAction)action1:(id)sender{
    [self button:self.box1 withIndex:0];
}
- (IBAction)action2:(id)sender{
    [self button:self.box2 withIndex:1];
}
- (IBAction)action3:(id)sender{
    [self button:self.box3 withIndex:2];
}
- (IBAction)action4:(id)sender{
    [self button:self.box4 withIndex:3];
}
- (IBAction)action5:(id)sender{
    [self button:self.box5 withIndex:4];
}
- (IBAction)action6:(id)sender{
    [self button:self.box6 withIndex:5];
}
- (IBAction)action7:(id)sender{
    [self button:self.box7 withIndex:6];
}
- (IBAction)action8:(id)sender{
    [self button:self.box8 withIndex:7];
}
- (IBAction)action9:(id)sender{
    [self button:self.box9 withIndex:8];
}
- (IBAction)action10:(id)sender{
    [self button:self.box10 withIndex:9];
}
- (IBAction)action11:(id)sender{
    [self button:self.box11 withIndex:10];
}
- (IBAction)action12:(id)sender{
    [self button:self.box12 withIndex:11];
}
- (IBAction)action13:(id)sender{
    [self button:self.box13 withIndex:12];
}
- (IBAction)action14:(id)sender{
    [self button:self.box14 withIndex:13];
}
- (IBAction)action15:(id)sender{
    [self button:self.box15 withIndex:14];
}
- (IBAction)action16:(id)sender{
    [self button:self.box16 withIndex:15];
}


- (IBAction)startAction:(id)sender{
    [UIView animateWithDuration:.25f animations:^{
        [self.endView setAlpha:0.0f];
    }];
    self.startButton.enabled = 0;
    self.shareButton.enabled = 0;
    self.box1.hidden = 0;
    self.box2.hidden = 0;
    self.box3.hidden = 0;
    self.box4.hidden = 0;
    self.box5.hidden = 0;
    self.box6.hidden = 0;
    self.box7.hidden = 0;
    self.box8.hidden = 0;
    self.box9.hidden = 0;
    self.box10.hidden = 0;
    self.box11.hidden = 0;
    self.box12.hidden = 0;
    self.box13.hidden = 0;
    self.box14.hidden = 0;
    self.box15.hidden = 0;
    self.box16.hidden = 0;
    self.highScore.hidden = 0;
    self.scoreLabel.hidden = 0;
    self.gameOver = NO;
    self.defuses = 0;
    self.time = 0;
    self.speed = 0.50f;
    self.rightSun.constant = 50;
    self.topSun.constant = 40;
    //self.gover.hidden = 1;
    op = 0.52f;
    opChange = 0.02f;
    [self.sky setAlpha:op];
    spacer = -1*(self.view.bounds.size.width / 45.0f);
    topSpacer = -1*(40.0f/25.0f);
    self.sunMoon.image = [UIImage imageNamed:@"Sun"];
    [self.backgroundGrass setAlpha:op];
    isSun = 1;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: 0"];
    self.boxArray = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil];
    [self.box1 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box2 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box3 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box4 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box5 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box6 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box7 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box8 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box9 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box10 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box11 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box12 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box13 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box14 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box15 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box16 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    boxTimer = [NSTimer scheduledTimerWithTimeInterval:self.speed target:self selector:@selector(goBombs) userInfo:nil repeats:YES];
    self.iAds.hidden = YES;
    self.bannerAdMob.hidden = YES;
}

- (IBAction)backAction:(id)sender {
    self.gameOver = NO;
    self.defuses = 0;
    self.time = 0;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: 0"];
    [boxTimer invalidate];
    self.boxArray = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil];
    [self.box1 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box2 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box3 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box4 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box5 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box6 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box7 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box8 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box9 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box10 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box11 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box12 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box13 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box14 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box15 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self.box16 setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    self.speed = 0.5f;
    self.iAds.hidden = YES;
    self.bannerAdMob.hidden = YES;
}

- (IBAction)shareAction:(id)sender {
    NSLog(@"shareButton pressed");
    self.bannerAdMob.hidden = YES;
    self.shareButton.highlighted = NO;
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]){
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, [UIScreen mainScreen].scale);}
    else{
        UIGraphicsBeginImageContext(self.view.bounds.size);}
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *data = UIImagePNGRepresentation(image);
    UIImage *swag = [UIImage imageWithData:data];
    NSString *texttoshare = @"Kicking some Grumpy Gopher butt! @Grumpy_Gopher #WhackPack";
    NSArray *activityItems = @[texttoshare, swag];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityVC.excludedActivityTypes = @[UIActivityTypeAssignToContact, UIActivityTypePrint, UIActivityTypeMail, UIActivityTypeCopyToPasteboard];
    self.bannerAdMob.hidden = NO;
    [self presentViewController:activityVC animated:TRUE completion:nil];
}

-(void) goBombs{
    self.time++;
    if (self.time == 10) {
        [boxTimer invalidate];
        self.speed = 0.45f;
        boxTimer = [NSTimer scheduledTimerWithTimeInterval:self.speed target:self selector:@selector(goBombs) userInfo:nil repeats:YES];
    }
    else if (self.time == 25)
    {
        [boxTimer invalidate];
        self.speed = 0.4f;
        boxTimer = [NSTimer scheduledTimerWithTimeInterval:self.speed target:self selector:@selector(goBombs) userInfo:nil repeats:YES];
    }
    else if (self.time == 50)
    {
        [boxTimer invalidate];
        self.speed = 0.33f;
        boxTimer = [NSTimer scheduledTimerWithTimeInterval:self.speed target:self selector:@selector(goBombs) userInfo:nil repeats:YES];
    }
    else if (self.time == 100)
    {
        [boxTimer invalidate];
        self.speed = 0.30f;
        boxTimer = [NSTimer scheduledTimerWithTimeInterval:self.speed target:self selector:@selector(goBombs) userInfo:nil repeats:YES];
    }
    else if (self.time == 150)
    {
        [boxTimer invalidate];
        self.speed = 0.25f;
        boxTimer = [NSTimer scheduledTimerWithTimeInterval:self.speed target:self selector:@selector(goBombs) userInfo:nil repeats:YES];
    }
    else if (self.time == 200)
    {
        [boxTimer invalidate];
        self.speed = 0.22f;
        boxTimer = [NSTimer scheduledTimerWithTimeInterval:self.speed target:self selector:@selector(goBombs) userInfo:nil repeats:YES];
    }
    else if (self.time == 250)
    {
        [boxTimer invalidate];
        self.speed = 0.20f;
        boxTimer = [NSTimer scheduledTimerWithTimeInterval:self.speed target:self selector:@selector(goBombs) userInfo:nil repeats:YES];
    }
    for (int i = 0; i<self.boxArray.count; i++)
    {
        if ([[self.boxArray objectAtIndex:i]intValue] == 5) {
            [boxTimer invalidate];
            AudioServicesPlaySystemSound(loseSound);
            [self.backButton setTitle:@"Too Slow" forState:UIControlStateNormal];
            self.backButton.enabled = NO;
            self.gameOver = YES;
            NSNumber *wackNum = [NSNumber numberWithInt:([[self.defaults objectForKey:@"wacks"] intValue]+self.defuses)];
            [self.defaults setObject:wackNum forKey:@"wacks"];
            restartTimer = [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(waitToStart) userInfo:nil repeats:NO];
            self.box1.hidden = 1;
            self.box2.hidden = 1;
            self.box3.hidden = 1;
            self.box4.hidden = 1;
            self.box5.hidden = 1;
            self.box6.hidden = 1;
            self.box7.hidden = 1;
            self.box8.hidden = 1;
            self.box9.hidden = 1;
            self.box10.hidden = 1;
            self.box11.hidden = 1;
            self.box12.hidden = 1;
            self.box13.hidden = 1;
            self.box14.hidden = 1;
            self.box15.hidden = 1;
            self.box16.hidden = 1;
            self.highScore.hidden = 1;
            self.scoreLabel.hidden = 1;
            [UIView animateWithDuration:.25f animations:^{
                [self.endView setAlpha:1.0f];
            }];
            if (self.defuses > (int)[self.defaults integerForKey:@"highScoreDefuses"]) {
                self.highScore.text = [NSString stringWithFormat:@"High Score: %i", self.defuses];
                [self.defaults setInteger:self.defuses forKey:@"highScoreDefuses"];
                [self.defaults synchronize];
            }
            NSLog(@"Wacks: %@", wackNum);
            
            if ([[[goalArray objectAtIndex:3] objectForKey:@"Done"] isEqualToString:@"No"] && [wackNum intValue] >=1000) {
                [self goalChecker:3 goalName:@"redSmall"];
            }
            if ([[[goalArray objectAtIndex:4] objectForKey:@"Done"] isEqualToString:@"No"] && [wackNum intValue] >=5000) {
                [self goalChecker:4 goalName:@"blueSmall"];
            }
            if ([[[goalArray objectAtIndex:5] objectForKey:@"Done"] isEqualToString:@"No"] && [wackNum intValue] >=10000) {
                [self goalChecker:5 goalName:@"orangeSmall"];
            }
            if ([[[goalArray objectAtIndex:6] objectForKey:@"Done"] isEqualToString:@"No"] && [wackNum intValue] >=50000) {
                [self goalChecker:6 goalName:@"pinkSmall"];
            }
            if ([[[goalArray objectAtIndex:7] objectForKey:@"Done"] isEqualToString:@"No"] && [wackNum intValue] >=100000) {
                [self goalChecker:7 goalName:@"purpleSmall"];
            }
            if (self.defuses >=350) {
                self.medal.image = [UIImage imageNamed:@"goldBig"];
            }
            else if (self.defuses >=225) {
                self.medal.image = [UIImage imageNamed:@"silverBig"];
            }
            else if (self.defuses >=100) {
                self.medal.image = [UIImage imageNamed:@"bronzeBig"];
            }
            else {
                self.medal.image = [UIImage imageNamed:@"nothingBig"];
            }
            self.endScore.text = [NSString stringWithFormat:@"%i", self.defuses];
            self.bestScore.text = [NSString stringWithFormat:@"%ld",(long)[self.defaults integerForKey:@"highScoreDefuses"]];
            self.iAds.hidden = NO;
            self.bannerAdMob.hidden = NO;
        }
        else if ([[self.boxArray objectAtIndex:i]intValue] > 0) {
            NSNumber *boxNum = [NSNumber numberWithInt:[[self.boxArray objectAtIndex:i]intValue] + 1];
            [self.boxArray setObject:boxNum atIndexedSubscript:i];
        }
        if (i == 0) {
            [self.box1 setImage:[self colorChange:[[self.boxArray objectAtIndex:i]intValue]] forState:UIControlStateNormal];
        }
        else if (i == 1){
            [self.box2 setImage:[self colorChange:[[self.boxArray objectAtIndex:i]intValue]] forState:UIControlStateNormal];
        }
        else if (i == 2) {
            [self.box3 setImage:[self colorChange:[[self.boxArray objectAtIndex:i]intValue]] forState:UIControlStateNormal];
        }
        else if (i == 3){
            [self.box4 setImage:[self colorChange:[[self.boxArray objectAtIndex:i]intValue]] forState:UIControlStateNormal];
        }
        else if (i == 4){
            [self.box5 setImage:[self colorChange:[[self.boxArray objectAtIndex:i]intValue]] forState:UIControlStateNormal];
        }
        else if (i == 5) {
            [self.box6 setImage:[self colorChange:[[self.boxArray objectAtIndex:i]intValue]] forState:UIControlStateNormal];
        }
        else if (i == 6){
            [self.box7 setImage:[self colorChange:[[self.boxArray objectAtIndex:i]intValue]] forState:UIControlStateNormal];
        }
        else if (i == 7){
            [self.box8 setImage:[self colorChange:[[self.boxArray objectAtIndex:i]intValue]] forState:UIControlStateNormal];
        }
        else if (i == 8) {
            [self.box9 setImage:[self colorChange:[[self.boxArray objectAtIndex:i]intValue]] forState:UIControlStateNormal];
        }
        else if (i == 9){
            [self.box10 setImage:[self colorChange:[[self.boxArray objectAtIndex:i]intValue]] forState:UIControlStateNormal];
        }
        else if (i == 10){
            [self.box11 setImage:[self colorChange:[[self.boxArray objectAtIndex:i]intValue]] forState:UIControlStateNormal];
        }
        else if (i == 11) {
            [self.box12 setImage:[self colorChange:[[self.boxArray objectAtIndex:i]intValue]] forState:UIControlStateNormal];
        }
        else if (i == 12){
            [self.box13 setImage:[self colorChange:[[self.boxArray objectAtIndex:i]intValue]] forState:UIControlStateNormal];
        }
        else if (i == 13){
            [self.box14 setImage:[self colorChange:[[self.boxArray objectAtIndex:i]intValue]] forState:UIControlStateNormal];
        }
        else if (i == 14) {
            [self.box15 setImage:[self colorChange:[[self.boxArray objectAtIndex:i]intValue]] forState:UIControlStateNormal];
        }
        else if (i == 15) {
            [self.box16 setImage:[self colorChange:[[self.boxArray objectAtIndex:i]intValue]] forState:UIControlStateNormal];
        }
    }
    [self getRandom];
}

-(void)getRandom{
    //NSLog(@"Performed");
    self.rand = arc4random_uniform(16);
    if (self.rand == 16){self.rand = 15;}
    //NSLog(@"Random: %i", self.rand);
    if ([[self.boxArray objectAtIndex:self.rand]intValue] == 0) {
        [self.boxArray setObject:[NSNumber numberWithInt:1] atIndexedSubscript:self.rand];
    }
    else {
        //NSLog(@"Done again");
        [self getRandom];
    }
    
    if (self.rand == 0) {
        [self.box1 setImage:[UIImage imageNamed:@"grumpy1"] forState:UIControlStateNormal];
    }
    else if (self.rand == 1) {
        [self.box2 setImage:[UIImage imageNamed:@"grumpy1"] forState:UIControlStateNormal];
    }
    else if (self.rand == 2) {
        [self.box3 setImage:[UIImage imageNamed:@"grumpy1"] forState:UIControlStateNormal];
    }
    else if (self.rand == 3) {
        [self.box4 setImage:[UIImage imageNamed:@"grumpy1"] forState:UIControlStateNormal];
    }
    else if (self.rand == 4) {
        [self.box5 setImage:[UIImage imageNamed:@"grumpy1"] forState:UIControlStateNormal];
    }
    else if (self.rand == 5) {
        [self.box6 setImage:[UIImage imageNamed:@"grumpy1"] forState:UIControlStateNormal];
    }
    else if (self.rand == 6) {
        [self.box7 setImage:[UIImage imageNamed:@"grumpy1"] forState:UIControlStateNormal];
    }
    else if (self.rand == 7) {
        [self.box8 setImage:[UIImage imageNamed:@"grumpy1"] forState:UIControlStateNormal];
    }
    else if (self.rand == 8) {
        [self.box9 setImage:[UIImage imageNamed:@"grumpy1"] forState:UIControlStateNormal];
    }
    else if (self.rand == 9) {
        [self.box10 setImage:[UIImage imageNamed:@"grumpy1"] forState:UIControlStateNormal];
    }
    else if (self.rand == 10) {
        [self.box11 setImage:[UIImage imageNamed:@"grumpy1"] forState:UIControlStateNormal];
    }
    else if (self.rand == 11) {
        [self.box12 setImage:[UIImage imageNamed:@"grumpy1"] forState:UIControlStateNormal];
    }
    else if (self.rand == 12) {
        [self.box13 setImage:[UIImage imageNamed:@"grumpy1"] forState:UIControlStateNormal];
    }
    else if (self.rand == 13) {
        [self.box14 setImage:[UIImage imageNamed:@"grumpy1"] forState:UIControlStateNormal];
    }
    else if (self.rand == 14) {
        [self.box15 setImage:[UIImage imageNamed:@"grumpy1"] forState:UIControlStateNormal];
    }
    else if (self.rand == 15) {
        [self.box16 setImage:[UIImage imageNamed:@"grumpy1"] forState:UIControlStateNormal];
    }
}

-(void)defused:(int)num{
    if ([[self.boxArray objectAtIndex:num]intValue] != 0) {
        NSURL *swipeURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"finalPop" ofType:@"m4a"]];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)swipeURL, &popSound);
        AudioServicesPlaySystemSound(popSound);
        
        [self.boxArray setObject:[NSNumber numberWithInt:0] atIndexedSubscript:num];
        self.defuses++;
        [self.sky setAlpha:op];
        if (self.defuses%50 == 0) {
            if (isSun){
                self.sunMoon.image = [UIImage imageNamed:@"Moon"];
                isSun = 0;
                [self.sky setAlpha:op];
            }
            else {
                self.sunMoon.image = [UIImage imageNamed:@"Sun"];
                isSun = 1;
                [self.sky setAlpha:op];
            }
            self.rightSun.constant = 50;
            self.topSun.constant = 40;
        }
        else
        {
            self.rightSun.constant+= spacer;
        }
        if (op >= 1.0f || op <= 0.0f) {
            opChange = opChange*-1;
            op+=opChange;
            [self.backgroundGrass setAlpha:op];
            //NSLog(@"Op: %f", op);
        }
        else {
            op+=opChange;
            [self.backgroundGrass setAlpha:op];
            //NSLog(@"Op: %f", op);
        }
        if (self.defuses%25 == 0) {
            topSpacer = topSpacer * -1;
        }
        else
        {
            self.topSun.constant+= topSpacer;
        }
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", self.defuses];
    }
    //NSLog(@"High Score: %ld", (long)[self.defaults integerForKey:@"highScoreDefuses"]);
    //NSLog(@"High Score: int %i", (int)[self.defaults integerForKey:@"highScoreDefuses"]);
    if (self.defuses > (int)[self.defaults integerForKey:@"highScoreDefuses"]) {
        //NSLog(@"hit: %ld", (long)[self.defaults integerForKey:@"highScoreDefuses"]);
        self.highScore.text = [NSString stringWithFormat:@"High Score: %i", self.defuses];
        [self.defaults setInteger:self.defuses forKey:@"highScoreDefuses"];
        [self.defaults synchronize];
    }
    if ([[[goalArray objectAtIndex:0] objectForKey:@"Done"] isEqualToString:@"No"] && self.defuses >=100) {
        [self goalChecker:0 goalName:@"bronzeSmall"];
    }
    if ([[[goalArray objectAtIndex:1] objectForKey:@"Done"] isEqualToString:@"No"] && self.defuses >=225) {
        [self goalChecker:1 goalName:@"silverSmall"];
    }
    if ([[[goalArray objectAtIndex:2] objectForKey:@"Done"] isEqualToString:@"No"] && self.defuses >=350) {
        [self goalChecker:2 goalName:@"goldSmall"];
    }
}

-(UIImage*)colorChange:(int)num{
    if (num == 0) {
        return [UIImage imageNamed:@"empty"];
    }
    else if (num == 1) {
        return [UIImage imageNamed:@"grumpy1"];
    }
    else if (num == 2) {
        return [UIImage imageNamed:@"grumpy2"];
    }
    else if (num == 3) {
        return [UIImage imageNamed:@"grumpy3"];
    }
    else if (num == 4) {
        return [UIImage imageNamed:@"grumpy4"];
    }
    else if (num == 5) {
        return [UIImage imageNamed:@"grumpyLast"];
    }
    else{
        return [UIImage imageNamed:@"grumpyLast"];;
    }
}

#pragma mark iAd delegate methods

//-(void)bannerViewDidLoadAd:(ADBannerView *)banner
//{
//    NSLog(@"Ad Loaded");
//    
//    [UIView beginAnimations:nil context:nil];
//    
//    [UIView setAnimationDuration:1];
//    
//    [banner setAlpha:1];
//    
//    [UIView commitAnimations];
//}
//
//-(void) bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
//{
//    NSLog(@"Ad did not load %@", error);
//    
//    [UIView beginAnimations:nil context:nil];
//    
//    [UIView setAnimationDuration:1];
//    
//    [banner setAlpha:0];
//    
//    [UIView commitAnimations];
//    
//}

- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error
{
    view.hidden = YES;
}

- (void)adViewDidReceiveAd:(GADBannerView *)view
{
    view.hidden = NO;
}

-(void) button:(UIButton *)button withIndex:(int)index{
    if ([[self.boxArray objectAtIndex:index]intValue] == 0) {
        [boxTimer invalidate];
        AudioServicesPlaySystemSound(loseSound);
        self.gameOver = YES;
        [self.backButton setTitle:@"Wrong Hole" forState:UIControlStateNormal];
        self.backButton.enabled = NO;
        NSNumber *wackNum = [NSNumber numberWithInt:([[self.defaults objectForKey:@"wacks"] intValue]+self.defuses)];
        [self.defaults setObject:wackNum forKey:@"wacks"];
        restartTimer = [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(waitToStart) userInfo:nil repeats:NO];
        self.box1.hidden = 1;
        self.box2.hidden = 1;
        self.box3.hidden = 1;
        self.box4.hidden = 1;
        self.box5.hidden = 1;
        self.box6.hidden = 1;
        self.box7.hidden = 1;
        self.box8.hidden = 1;
        self.box9.hidden = 1;
        self.box10.hidden = 1;
        self.box11.hidden = 1;
        self.box12.hidden = 1;
        self.box13.hidden = 1;
        self.box14.hidden = 1;
        self.box15.hidden = 1;
        self.box16.hidden = 1;
        self.highScore.hidden = 1;
        self.scoreLabel.hidden = 1;
        [UIView animateWithDuration:.25f animations:^{
            [self.endView setAlpha:1.0f];
        }];
        //NSLog(@"Box Array: %@", self.boxArray);
        if (self.defuses > (int)[self.defaults integerForKey:@"highScoreDefuses"]) {
            self.highScore.text = [NSString stringWithFormat:@"High Score: %i", self.defuses];
            [self.defaults setInteger:self.defuses forKey:@"highScoreDefuses"];
            [self.defaults synchronize];
        }
        if (self.defuses >=350) {
            self.medal.image = [UIImage imageNamed:@"goldBig"];
        }
        else if (self.defuses >=225) {
            self.medal.image = [UIImage imageNamed:@"silverBig"];
        }
        else if (self.defuses >=100) {
            self.medal.image = [UIImage imageNamed:@"bronzeBig"];
        }
        else {
            self.medal.image = [UIImage imageNamed:@"nothingBig"];
        }
        self.endScore.text = [NSString stringWithFormat:@"%i", self.defuses];
        self.bestScore.text = [NSString stringWithFormat:@"%ld",(long)[self.defaults integerForKey:@"highScoreDefuses"]];
        self.iAds.hidden = NO;
        self.bannerAdMob.hidden = NO;
    }
    else if (self.gameOver == NO) {
         NSNumber *wackNum = [NSNumber numberWithInt:([[self.defaults objectForKey:@"wacks"] intValue]+self.defuses)];
        NSLog(@"Wacks: %@", wackNum);
        NSLog(@"Goal 5: %@",[goalArray objectAtIndex:5]);
        if ([[[goalArray objectAtIndex:3] objectForKey:@"Done"] isEqualToString:@"No"] && [wackNum intValue] >=1000) {
            [self goalChecker:3 goalName:@"redSmall"];
        }
        if ([[[goalArray objectAtIndex:4] objectForKey:@"Done"] isEqualToString:@"No"] && [wackNum intValue] >=5000) {
            [self goalChecker:4 goalName:@"blueSmall"];
        }
        if ([[[goalArray objectAtIndex:5] objectForKey:@"Done"] isEqualToString:@"No"] && [wackNum intValue] >=10000) {
            [self goalChecker:5 goalName:@"orangeSmall"];
        }
        if ([[[goalArray objectAtIndex:6] objectForKey:@"Done"] isEqualToString:@"No"] && [wackNum intValue] >=50000) {
            [self goalChecker:6 goalName:@"pinkSmall"];
        }
        if ([[[goalArray objectAtIndex:7] objectForKey:@"Done"] isEqualToString:@"No"] && [wackNum intValue] >=100000) {
            [self goalChecker:7 goalName:@"purpleSmall"];
        }
        [button setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
        [self defused:index];
    }
}

-(void)flashChange{
    flashCounter++;
    if (flashCounter == 0 || flashCounter == 2) {
        self.startButton.titleLabel.textColor = [UIColor whiteColor];
        self.shareButton.titleLabel.textColor = [UIColor whiteColor];
    }
    else if (flashCounter == 1) {
        self.startButton.titleLabel.textColor = [UIColor redColor];
        self.shareButton.titleLabel.textColor = [UIColor redColor];
    }
    else if (flashCounter == 3) {
        self.startButton.titleLabel.textColor = [UIColor orangeColor];
        self.shareButton.titleLabel.textColor = [UIColor orangeColor];
        flashCounter = 0;
    }
}

-(void)goGoal{
    self.backButton.titleLabel.textColor = [UIColor whiteColor];
    [self.backButton setTitle:@"Main Menu" forState:UIControlStateNormal];
    if (isSun) {
        [self.sunMoon setImage:[UIImage imageNamed:@"Sun"]];
    }
    else {
        [self.sunMoon setImage:[UIImage imageNamed:@"Moon"]];
    }
}
-(void)goalChecker:(int)num goalName:(NSString*)iName{
    NSMutableDictionary *tempDict = [[goalArray objectAtIndex:num] mutableCopy];
    [tempDict setObject:@"Yes" forKey:@"Done"];
    [goalArray setObject:tempDict atIndexedSubscript:num];
    [self.defaults setObject:goalArray forKey:@"goals"];
    [self.defaults synchronize];
    [self.backButton setTitle:@"Achievement" forState:UIControlStateNormal];
    [self.sunMoon setImage:[UIImage imageNamed:iName]];
    goalTimer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(goGoal) userInfo:nil repeats:NO];
    self.backButton.titleLabel.textColor = [UIColor orangeColor];
}

-(void)waitToStart
{
    [self.backButton setTitle:@"Main Menu" forState:UIControlStateNormal];
    self.backButton.enabled = YES;
    self.startButton.enabled = YES;
    self.shareButton.enabled = YES;
}
@end


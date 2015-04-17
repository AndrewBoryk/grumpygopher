//
//  HowToViewController.m
//  justKeepTapping
//
//  Created by Andrew Boryk on 1/25/15.
//  Copyright (c) 2015 Andrew Boryk. All rights reserved.
//

#import "HowToViewController.h"

@interface HowToViewController ()

@end

NSTimer *boxTimer;
NSTimer *waitTimer;
NSTimer *flashingTimer;
int flashCounter;

@implementation HowToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"grassBackground"];
    UIImage *newImage = [UIImage imageWithCGImage:[image CGImage] scale:4.0 orientation:image.imageOrientation];
    [self.backButton setTitle:@"Main Menu" forState:UIControlStateNormal];
    [self.backgroundGrass setBackgroundColor:[UIColor colorWithPatternImage:newImage]];
    [self.backButton.titleLabel setFont:[UIFont fontWithName:@"8BITWONDERNominal" size:25]];
    self.one.font = [UIFont fontWithName:@"8BITWONDERNominal" size:15];
    self.two.font = [UIFont fontWithName:@"8BITWONDERNominal" size:15];
    self.three.font = [UIFont fontWithName:@"8BITWONDERNominal" size:15];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
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
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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
    boxTimer = [NSTimer scheduledTimerWithTimeInterval:0.49f target:self selector:@selector(goBombs) userInfo:nil repeats:YES];
    flashCounter = 0;
    flashingTimer = [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(flashChange) userInfo:nil repeats:YES];
}

- (IBAction)backAction:(id)sender {
    [boxTimer invalidate];
    [flashingTimer invalidate];
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

-(void) goBombs{
    for (int i = 0; i<self.boxArray.count; i++)
    {
        if ([[self.boxArray objectAtIndex:i]intValue] == 5) {
            NSNumber *resBoxNum = [NSNumber numberWithInt:0];
            [self.boxArray setObject:resBoxNum atIndexedSubscript:i];
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

-(void) button:(UIButton *)button withIndex:(int)index{
    [button setImage:[UIImage imageNamed:@"empty"] forState:UIControlStateNormal];
    [self defused:index];
}

-(void)defused:(int)num{
    if ([[self.boxArray objectAtIndex:num]intValue] != 0) {
        [self.boxArray setObject:[NSNumber numberWithInt:0] atIndexedSubscript:num];
    }
}

-(void)flashChange{
    flashCounter++;
    if (flashCounter == 0 || flashCounter == 2) {
        self.backButton.titleLabel.textColor = [UIColor whiteColor];
    }
    else if (flashCounter == 1) {
        self.backButton.titleLabel.textColor = [UIColor redColor];
    }
    else if (flashCounter == 3) {
        self.backButton.titleLabel.textColor = [UIColor orangeColor];
        flashCounter = 0;
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

@end

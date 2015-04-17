//
//  mainTableButton.m
//  justKeepTapping
//
//  Created by Andrew Boryk on 1/26/15.
//  Copyright (c) 2015 Andrew Boryk. All rights reserved.
//

#import "mainTableButton.h"

@implementation mainTableButton

NSTimer *flashingTimer;
int flashCounter;
- (void)drawRect:(CGRect)rect
{
    [self.titleLabel setFont:[UIFont fontWithName:@"8BITWONDERNominal" size:25]];
    flashCounter = 0;
    flashingTimer = [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(flashChange) userInfo:nil repeats:YES];
}

-(void)flashChange{
    flashCounter++;
    if (flashCounter == 0 || flashCounter == 2) {
        self.titleLabel.textColor = [UIColor whiteColor];
    }
    else if (flashCounter == 1) {
        self.titleLabel.textColor = [UIColor redColor];
    }
    else if (flashCounter == 3) {
        self.titleLabel.textColor = [UIColor orangeColor];
        flashCounter = 0;
    }
}


@end

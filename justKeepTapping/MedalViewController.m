//
//  MedalViewController.m
//  justKeepTapping
//
//  Created by Andrew Boryk on 1/26/15.
//  Copyright (c) 2015 Andrew Boryk. All rights reserved.
//

#import "MedalViewController.h"

@interface MedalViewController ()

@end

UIImage *day;
NSUserDefaults *defaults;
NSMutableArray *gArray;
@implementation MedalViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *bronzeGoal = [NSDictionary dictionaryWithObjectsAndKeys:@"Bronze Medal", @"Title", @"Reach a score of 100", @"Subtitle", @"bronzeSmall", @"Icon", @"No", @"Done", nil];
    NSDictionary *silverGoal = [NSDictionary dictionaryWithObjectsAndKeys:@"Silver Medal", @"Title", @"Reach a score of 225", @"Subtitle", @"silverSmall", @"Icon", @"No", @"Done", nil];
    NSDictionary *goldGoal = [NSDictionary dictionaryWithObjectsAndKeys:@"Gold Medal", @"Title", @"Reach a score of 350", @"Subtitle", @"goldSmall", @"Icon", @"No", @"Done", nil];
    NSDictionary *redGoal = [NSDictionary dictionaryWithObjectsAndKeys:@"Novice", @"Title", @"Whack 1,000 Gophers", @"Subtitle", @"redSmall", @"Icon", @"No", @"Done", nil];
    NSDictionary *blueGoal = [NSDictionary dictionaryWithObjectsAndKeys:@"Average", @"Title", @"Whack 5,000 Gophers", @"Subtitle", @"blueSmall", @"Icon", @"No", @"Done", nil];
    NSDictionary *orangeGoal = [NSDictionary dictionaryWithObjectsAndKeys:@"Pretty Good", @"Title", @"Whack 10,000 Gophers", @"Subtitle", @"orangeSmall", @"Icon", @"No", @"Done", nil];
    NSDictionary *purpleGoal = [NSDictionary dictionaryWithObjectsAndKeys:@"Professional", @"Title", @"Whack 50,000 Gophers", @"Subtitle", @"pinkSmall", @"Icon", @"No", @"Done", nil];
    NSDictionary *emeraldGoal = [NSDictionary dictionaryWithObjectsAndKeys:@"Master", @"Title", @"Whack 100,000 Gophers", @"Subtitle", @"purpleSmall", @"Icon", @"No", @"Done", nil];
    gArray = [NSMutableArray arrayWithObjects:bronzeGoal, silverGoal, goldGoal,redGoal, blueGoal, orangeGoal,purpleGoal,emeraldGoal, nil];
    self.goalArray = [defaults objectForKey:@"goals"];
    UIImage *image = [UIImage imageNamed:@"grassBackground"];
    day = [UIImage imageWithCGImage:[image CGImage] scale:4.0 orientation:image.imageOrientation];
    [self.gophersWacked.titleLabel setFont: [UIFont fontWithName:@"8BITWONDERNominal" size:14]];
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle]; // this line is important!
    NSString *formatted = [formatter stringFromNumber:[defaults objectForKey:@"wacks"]];
    [self.gophersWacked setTitle:[NSString stringWithFormat:@"%@ whacks", formatted] forState:UIControlStateNormal];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.goalArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//    [cell setBackgroundColor:[UIColor colorWithPatternImage:day]];
    UIImage *image;
    if ([[[self.goalArray objectAtIndex:indexPath.row] objectForKey:@"Done"] isEqualToString:@"Yes"]) {
        image = [UIImage imageNamed:[[self.goalArray objectAtIndex:indexPath.row] objectForKey:@"Icon"]];
    }
    else{
        image = [UIImage imageNamed:@"nothingSmall"];
    }
    CGSize itemSize = CGSizeMake(40, 40);
    UIGraphicsBeginImageContext(itemSize);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    cell.textLabel.text = [[gArray objectAtIndex:indexPath.row] objectForKey:@"Title"];
    cell.detailTextLabel.text = [[gArray objectAtIndex:indexPath.row] objectForKey:@"Subtitle"];
    CGSize sizer = CGSizeMake(1.0f, 2.0f);
    [cell.detailTextLabel setShadowOffset:sizer];
    [cell.textLabel setShadowOffset:sizer];
    [cell.detailTextLabel setShadowColor:[UIColor blackColor]];
    [cell.textLabel setShadowColor:[UIColor blackColor]];
    [cell.detailTextLabel setTextColor:[UIColor whiteColor]];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    [cell.detailTextLabel setFont:[UIFont fontWithName:@"8BITWONDERNominal" size:11]];
    [cell.textLabel setFont:[UIFont fontWithName:@"8BITWONDERNominal" size:15]];
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ExperimentalViewController.m
//  words-drawings
//
//  Created by Sarah Hermanns on 9/22/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "ExperimentalViewController.h"
#import "DHSmartScreenshot.h"
#import <UIKit/UIKit.h>
#import "EndOfGameViewController.h"

@interface ExperimentalViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation ExperimentalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)captureGame:(id)sender {
  
 UIView *tableViewScreenshot = [self.view snapshotViewAfterScreenUpdates:false];

//  UIImage * tableViewScreenshot = [self.tableView screenshot];
  
  EndOfGameViewController *destinationVC = [[EndOfGameViewController alloc] init];
  destinationVC.tableViewScreenshot = tableViewScreenshot;
 
  [self.navigationController pushViewController:destinationVC animated:true];

  
}

//let snapShot = userCell.imageView.snapshotViewAfterScreenUpdates

@end

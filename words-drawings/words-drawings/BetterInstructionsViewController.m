//
//  BetterInstructionsViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/24/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "BetterInstructionsViewController.h"
#import "MainViewController.h"

@interface BetterInstructionsViewController ()

- (IBAction)closeThisButton:(UIButton *)sender;


@end

@implementation BetterInstructionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeThisButton:(UIButton *)sender {
  
  [UIView animateWithDuration:0.4 animations:^{
    self.view.alpha = 0;
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
  }];
  
}
@end

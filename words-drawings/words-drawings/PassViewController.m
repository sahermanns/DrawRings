//
//  PassViewController.m
//  words-drawings
//
//  Created by Kristen Kozmary on 9/21/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "PassViewController.h"

@interface PassViewController ()

@end

@implementation PassViewController

- (void)viewDidLoad {
  [super viewDidLoad];

}

- (IBAction)button:(id)sender {
  [[NSNotificationCenter defaultCenter] postNotificationName:@"popButtonPressed" object:self];
}
@end

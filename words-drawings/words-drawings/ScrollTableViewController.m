//
//  ScrollTableViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/11/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "ScrollTableViewController.h"
#import "DrawingTableViewCell.h"
#import "WordsTableViewCell.h"
#import "PassItOnViewController.h"
#import "PassViewController.h"

@interface ScrollTableViewController ()

@property (nonatomic) NSInteger numberOfRows;
//@property (strong, nonatomic) NSString *seedPrompt;
@property (strong, nonatomic) NSString *currentPrompt;
@property (strong, nonatomic) NSMutableArray *promptArray;
@property (strong, nonatomic) NSMutableArray *drawingArray;
@property (strong, nonatomic) IBOutlet UITableView *scrollTableView;
//@property int counter;


@end

@implementation ScrollTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.scrollTableView.allowsSelection = NO;
  //[self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
  //_seedPrompt = @"ARRRRGGGGHHH";
  NSLog(@"SEED PROMPT: %@", _seedPrompt);
  
  self.counter = 0;
  //NSLog(@"counter starts at %d", _counter);
  self.numberOfRows = 4;

  UINib *wordsCell = [UINib nibWithNibName:@"wordsCell" bundle:nil];
  [self.scrollTableView registerNib:wordsCell forCellReuseIdentifier:@"wordsCell"];
  
  UINib *drawingCell = [UINib nibWithNibName:@"drawingCell" bundle:nil];
  [self.scrollTableView registerNib:drawingCell forCellReuseIdentifier:@"drawingCell"];
//  NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_counter inSection:0];
//  [self.scrollTableView scrollToRowAtIndexPath:indexPath
//                        atScrollPosition:UITableViewScrollPositionMiddle
//                                animated:NO];
  /*
  NSIndexPath *indexPath = 1;
  
  [self.scrollTableView scrollToRowAtIndexPath: atScrollPosition: UITableViewScrollPositionTop animated: YES];
    */
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  
  [[NSNotificationCenter defaultCenter] addObserverForName:@"doneDrawingNotification" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
    [self showNextCell];

    PassViewController *passView = [[PassViewController alloc] initWithNibName:@"PassViewController" bundle:[NSBundle mainBundle]];
    [_navController pushViewController:passView animated:YES];
    
  }];
  
  [[NSNotificationCenter defaultCenter] addObserverForName:@"popButtonPressed" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
    [_navController popViewControllerAnimated:YES];
  }];
  
  [[NSNotificationCenter defaultCenter] addObserverForName:@"doneGuessingNotification" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
    [self showNextCell];
    
    PassViewController *passView = [[PassViewController alloc] initWithNibName:@"PassViewController" bundle:[NSBundle mainBundle]];
    [_navController pushViewController:passView animated:YES];
  }];
}

- (void)showNextCell {
  self.counter++;
  NSLog(@"UMM %d", self.counter);
  NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_counter inSection:0];
  [self.scrollTableView scrollToRowAtIndexPath:indexPath
                              atScrollPosition:UITableViewScrollPositionMiddle
                                      animated:NO];
  
  if (_counter < _numberOfRows) {
    //
  } else {
    //go to souvenir page ending
  }
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row % 2 == 0) {
    DrawingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"drawingCell" forIndexPath:indexPath];
    cell.promptLabel.text = _seedPrompt;
    return cell;
  } else {
    WordsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"wordsCell" forIndexPath:indexPath];
    return cell;
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  //[self.scrollTableView scrollToRowAtIndexPath:indexPath atScrollPosition: UITableViewScrollPositionMiddle animated: YES];
  CGFloat cellHeight = tableView.frame.size.height;
  return cellHeight;
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

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
#import "JotViewController.h"

@interface ScrollTableViewController () <JotViewControllerDelegate>

@property (nonatomic) NSInteger numberOfRows;
//@property (strong, nonatomic) NSString *seedPrompt;
@property (strong, nonatomic) NSString *currentPrompt;
@property (strong, nonatomic) NSMutableArray *promptArray;
@property (strong, nonatomic) NSMutableArray *drawingArray;
@property (strong, nonatomic) IBOutlet UITableView *scrollTableView;
@property (nonatomic, strong) JotViewController *jotVC;
@property int counter;


@end

@implementation ScrollTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  self.scrollTableView.allowsSelection = NO;

  NSLog(@"SEED PROMPT: %@", _seedPrompt);
  
  _promptArray = [[NSMutableArray alloc] init];
  [_promptArray addObject: _seedPrompt];
  
  _drawingArray = [[NSMutableArray alloc] init];
  
  self.counter = 0;
  NSLog(@"counter starts at %d", _counter);
  
  self.numberOfRows = self.numberOfPlayers;

  UINib *wordsCell = [UINib nibWithNibName:@"wordsCell" bundle:nil];
  [self.scrollTableView registerNib:wordsCell forCellReuseIdentifier:@"wordsCell"];
  
  UINib *drawingCell = [UINib nibWithNibName:@"drawingCell" bundle:nil];
  [self.scrollTableView registerNib:drawingCell forCellReuseIdentifier:@"drawingCell"];
  
  [[NSNotificationCenter defaultCenter] addObserverForName:@"doneDrawingNotification" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
    UIImage *drawnImage = [self.jotVC renderImageWithScale:2.f
                                                               onColor:self.view.backgroundColor];
    
    [_drawingArray addObject:drawnImage];
    
    [self.jotVC clearAll];

    [self showNextCell];
    _counter++;
    PassViewController *passView = [[PassViewController alloc] initWithNibName:@"PassViewController" bundle:[NSBundle mainBundle]];
    [_navController pushViewController:passView animated:YES];
  }];
  
  //press the GO button on the pass vc
  [[NSNotificationCenter defaultCenter] addObserverForName:@"popButtonPressed" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
    [_navController popViewControllerAnimated:YES];
  }];
  
  [[NSNotificationCenter defaultCenter] addObserverForName:@"doneGuessingNotification" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
    [self showNextCell];
    
    WordsTableViewCell *wordsTVC = [[WordsTableViewCell alloc] init];
    NSString *enteredString = wordsTVC.textField.text;
    [_promptArray addObject:enteredString];
    
    for (NSString *string in _promptArray){
      NSLog(@"IN PROMPT ARRAY: %@", string);
    }
    
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
    self.jotVC = [[JotViewController alloc] init];
    self.jotVC.delegate = self;
    self.jotVC.state = JotViewStateDrawing;
    [self addChildViewController:self.jotVC];
    [cell.contentView addSubview:self.jotVC.view];
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    [self.jotVC didMoveToParentViewController:self];
    self.jotVC.view.frame = cell.drawingView.frame;
    cell.promptLabel.text = _seedPrompt;
    cell.timerLabel.text = [NSString stringWithFormat:@"%ld",(long)_durationOfRound];
    return cell;
  } else {
    WordsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"wordsCell" forIndexPath:indexPath];
//    UIImage *currentImage = _drawingArray[0];
//    NSLog(@"currentImage descrip: %@", currentImage.description);
    //cell.imageView.image = [UIImage image];
    cell.imageView.image = [_drawingArray objectAtIndex:0];
//    WordsTableViewCell *wordsTVC = [[WordsTableViewCell alloc] init];
//    wordsTVC.textField
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

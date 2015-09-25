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
#import "SketchGuess.h"
#import "Sketch.h"
#import "Guess.h"

@interface ScrollTableViewController () <JotViewControllerDelegate, UITextFieldDelegate>

@property (nonatomic) NSInteger numberOfRows;
//@property (strong, nonatomic) NSString *seedPrompt;
@property (strong, nonatomic) NSString *currentPrompt;
@property (strong, nonatomic) NSMutableArray *promptArray;
@property (strong, nonatomic) NSMutableArray *drawingArray;
@property (strong, nonatomic) IBOutlet UITableView *scrollTableView;
@property (strong, nonatomic) DrawingTableViewCell *currentDrawingCell;
@property (strong, nonatomic) WordsTableViewCell *currentWordsCell;
@property (nonatomic, strong) JotViewController *jotVC;
@property (weak, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSMutableArray *sketchGuesses;
@property (nonatomic) NSInteger currentSketchGuessIndex;

@end

@implementation ScrollTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  self.sketchGuesses = [[NSMutableArray alloc] init];
  [self sketchGuessesForNumberOfPlayers];
  self.currentSketchGuessIndex = 0;
  self.scrollTableView.allowsSelection = NO;
  self.currentWordsCell.textField.delegate = self;

//  self.currentWordsCell.textField.autocorrectionType = UITextAutocorrectionTypeNo;
  NSLog(@"SEED PROMPT: %@", _seedPrompt);
  
  _promptArray = [[NSMutableArray alloc] init];
  [_promptArray addObject: _seedPrompt];
  
  _drawingArray = [[NSMutableArray alloc] init];
  
  //self.numberOfRows = self.numberOfPlayers - 1;

  UINib *wordsCell = [UINib nibWithNibName:@"wordsCell" bundle:nil];
  [self.scrollTableView registerNib:wordsCell forCellReuseIdentifier:@"wordsCell"];
  
  UINib *drawingCell = [UINib nibWithNibName:@"drawingCell" bundle:nil];
  [self.scrollTableView registerNib:drawingCell forCellReuseIdentifier:@"drawingCell"];
  
  [[NSNotificationCenter defaultCenter] addObserverForName:@"doneDrawingNotification" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
    //Save the current drawing
    UIImage *drawnImage = [self.jotVC renderImageWithScale:2.f onColor:self.view.backgroundColor];
    SketchGuess *currentSketchGuess = self.sketchGuesses[self.currentSketchGuessIndex];
    currentSketchGuess.sketch.sketchImage = drawnImage;

    //Prepare the next Cell
    [self.jotVC clearAll];
    [self showGuessCell];
    
    //Present the interstitial View Controller
    PassViewController *passView = [[PassViewController alloc] initWithNibName:@"PassViewController" bundle:[NSBundle mainBundle]];
    [_navController pushViewController:passView animated:YES];
    [self.timer invalidate];
  }];
  
  //press the GO button on the pass vc
  [[NSNotificationCenter defaultCenter] addObserverForName:@"popButtonPressed" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
    [_navController popViewControllerAnimated:YES];
    [_scrollTableView reloadData];
  }];
  
  [[NSNotificationCenter defaultCenter] addObserverForName:@"doneGuessingNotification" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
    
    NSString *enteredString;
    enteredString = self.currentWordsCell.textField.text;
    SketchGuess *currentSketchGuess = self.sketchGuesses[self.currentSketchGuessIndex];
    currentSketchGuess.guess.guessString = enteredString;
   
    self.currentSketchGuessIndex++;
    [self showNextSketchGuess];
    for (NSString *string in _promptArray){
      NSLog(@"IN PROMPT ARRAY: %@", string);
    }
    
    if([[_scrollTableView indexPathsForVisibleRows] firstObject].row < _numberOfRows -1)
    {
      PassViewController *passView = [[PassViewController alloc] initWithNibName:@"PassViewController" bundle:[NSBundle mainBundle]];
      [_navController pushViewController:passView animated:YES];
    }
    [self.timer invalidate];
  }];
}
-(void)sketchGuessesForNumberOfPlayers {
  NSInteger numberOfSketchersAndGuessers = self.numberOfPlayers - 1;
  if (numberOfSketchersAndGuessers % 2 == 0) {
    NSInteger numberOfSketchGuesses = numberOfSketchersAndGuessers / 2;
    for (int i = 0; i < numberOfSketchGuesses; i++) {
      SketchGuess *sketchGuess = [[SketchGuess alloc] init];
      sketchGuess.guess = [[Guess alloc] init];
      sketchGuess.sketch = [[Sketch alloc] init];
      [self.sketchGuesses addObject:sketchGuess];
    }
  } else {
//    NSInteger numberOfSketchGuesses = numberOfSketchersAndGuessers / 2;
    NSInteger numberOfSketchGuesses = (numberOfSketchersAndGuessers + 1) / 2;
    for (int i = 0; i < numberOfSketchGuesses; i++) {
      SketchGuess *sketchGuess = [[SketchGuess alloc] init];
      sketchGuess.guess = [[Guess alloc] init];
      sketchGuess.sketch = [[Sketch alloc] init];
      [self.sketchGuesses addObject:sketchGuess];
    }
    SketchGuess *lastSketchGuess = self.sketchGuesses.lastObject;
    lastSketchGuess.guess = nil;
  }
}

-(void)showGuessCell {
  
  SketchGuess *currentSketchGuess = self.sketchGuesses[self.currentSketchGuessIndex];
  
  if (currentSketchGuess.guess) {
    NSIndexPath *destinationIndexPath = [NSIndexPath indexPathForRow:1 inSection:self.currentSketchGuessIndex];
}

-(void)decrementTimeLabel:(NSTimer *)timer {
  
  if (self.currentDrawingCell) {
    NSInteger newTime = [self.currentDrawingCell.timerLabel.text integerValue] -1;
    NSString *newTimeString = [NSString stringWithFormat: @"%ld",newTime];
    self.currentDrawingCell.timerLabel.text = newTimeString;
    
    [self.scrollTableView scrollToRowAtIndexPath:destinationIndexPath
    if (newTime == 0) {
      [timer invalidate];
      [[NSNotificationCenter defaultCenter] postNotificationName:@"doneDrawingNotification" object:self];
    }
  }
  
  if (self.currentWordsCell) {
    NSInteger newTime = [self.currentWordsCell.timeLabel.text integerValue] -1;
    NSString *newTimeString = [NSString stringWithFormat: @"%ld",newTime];
    self.currentWordsCell.timeLabel.text = newTimeString;
    
    if (newTime == 0) {
      [timer invalidate];
      [[NSNotificationCenter defaultCenter] postNotificationName:@"doneDrawingNotification" object:self];
    }
  }
}


- (void)showNextCell {
  NSIndexPath *indexPath = [[_scrollTableView indexPathsForVisibleRows] firstObject];
  if (indexPath.row < _numberOfRows - 1) {
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:0];
    [self.scrollTableView scrollToRowAtIndexPath:nextIndexPath
                                atScrollPosition:UITableViewScrollPositionTop
                                        animated:NO];
    
    
      PassViewController *passView = [[PassViewController alloc] initWithNibName:@"PassViewController" bundle:[NSBundle mainBundle]];
      [_navController pushViewController:passView animated:YES];
    
  } else {
     [self performSegueWithIdentifier:@"ShowEndOfGame" sender:self];
  }

}
- (void)showNextSketchGuess {
  
  if (self.currentSketchGuessIndex == self.sketchGuesses.count
      ) {
     [self performSegueWithIdentifier:@"ShowEndOfGame" sender:self];
  } else {
    NSIndexPath *destinationIndexPath = [NSIndexPath indexPathForRow:0 inSection:self.currentSketchGuessIndex];
    [self.scrollTableView scrollToRowAtIndexPath:destinationIndexPath
                                atScrollPosition:UITableViewScrollPositionTop
                                        animated:NO];
    PassViewController *passView = [[PassViewController alloc] initWithNibName:@"PassViewController" bundle:[NSBundle mainBundle]];
    [_navController pushViewController:passView animated:YES];
  }
}



//-(void)viewDidAppear:(BOOL)animated {
//  [super viewDidAppear:animated];
//  if (self.currentWordsCell) {
//    NSString *enteredString;
//    enteredString = self.currentWordsCell.textField.text;
//    [self.promptArray addObject:enteredString];
//  }
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return self.sketchGuesses.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  SketchGuess *sketchGuess = self.sketchGuesses[section];
  if (sketchGuess.guess) {
    return 2;
  }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  SketchGuess *sketchGuess = self.sketchGuesses[indexPath.section];
  if (indexPath.row == 0) {
    DrawingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"drawingCell" forIndexPath:indexPath];
    self.jotVC = [[JotViewController alloc] init];
    self.jotVC.delegate = self;
    self.jotVC.state = JotViewStateDrawing;
    [self addChildViewController:self.jotVC];
    [cell.contentView addSubview:self.jotVC.view];
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    self.currentDrawingCell = cell;
    if (self.currentSketchGuessIndex > 0) {
      SketchGuess *previousSketchGuess = self.sketchGuesses[self.currentSketchGuessIndex - 1];
      cell.promptLabel.text = previousSketchGuess.guess.guessString;
    } else {
      cell.promptLabel.text = _seedPrompt;
    }
    
    
    [self.jotVC didMoveToParentViewController:self];
    self.jotVC.view.frame = cell.drawingView.frame;
    //    cell.promptLabel.text = _seedPrompt;
    cell.timerLabel.text = [NSString stringWithFormat:@"%ld",(long)_durationOfRound];
    return cell;

  } else {
    WordsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"wordsCell" forIndexPath:indexPath];
    self.currentWordsCell = cell;
    cell.textField.text = @"";
    cell.drawingImageView.backgroundColor = [UIColor blueColor];
    cell.drawingImageView.image = sketchGuess.sketch.sketchImage;
    return cell;

  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  CGFloat cellHeight = tableView.frame.size.height;
  return cellHeight;
}


@end

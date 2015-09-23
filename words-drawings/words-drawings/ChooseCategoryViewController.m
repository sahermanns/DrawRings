//
//  ChooseCategoryViewController.m
//  words-drawings
//
//  Created by Matthew McClure on 9/20/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "ChooseCategoryViewController.h"
#import "ChooseOptionViewController.h"
#import <stdlib.h>

@interface ChooseCategoryViewController ()

@property (strong,nonatomic) NSString *categoryPressed;

- (IBAction)goBack:(UIButton *)sender;

- (IBAction)category1Pressed:(UIButton *)sender;
- (IBAction)category2Pressed:(UIButton *)sender;
- (IBAction)category3Pressed:(UIButton *)sender;

@property (strong,nonatomic) NSMutableArray *filmArray;
@property (strong,nonatomic) NSMutableArray *tvArray;
@property (strong,nonatomic) NSMutableArray *theatreArray;
@property (strong,nonatomic) NSMutableArray *musicArray;
@property (strong,nonatomic) NSMutableArray *sportsArray;
@property (strong,nonatomic) NSMutableArray *historyArray;
@property (strong,nonatomic) NSMutableArray *scienceArray;
@property (strong,nonatomic) NSMutableArray *natureArray;
@property (strong,nonatomic) NSMutableArray *geographyArray;
@property (strong,nonatomic) NSMutableArray *artArray;
@property (strong,nonatomic) NSMutableArray *literatureArray;
@property (strong,nonatomic) NSMutableArray *zanyMiscellanyArray;

@property (strong,nonatomic) NSMutableArray *categoriesArray;
@property (strong,nonatomic) NSMutableArray *thisRoundsArray;
@property (strong,nonatomic) NSMutableArray *selectedArray;
@property (strong,nonatomic) NSMutableArray *mutableArrayContainingNumbers;

@end

@implementation ChooseCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  _categoriesArray = [NSMutableArray arrayWithObjects: @"FILM", @"TV", @"THEATRE", @"MUSIC", @"SPORTS", @"HISTORY", @"SCIENCE", @"NATURE", @"GEOGRAPHY", @"ART", @"LITERATURE", @"ZANY MISCELLANY", nil];
  
  _filmArray = [NSMutableArray arrayWithObjects: @"The Godfather", @"Woody Allen", @"Steven Spielberg", @"Rocky", @"Rushmore", @"Back to the Future II", @"Alice in Wonderland", @"Boogie Nights", @"Space Jam", @"Mission: Impossible", @"Annie Hall", @"Being John Malkovich", @"Metropolis", @"The Dark Crystal", @"Vertigo", @"Star Trek", @"Iron Man", @"Hannibal Lecter", @"Meet the Parents", @"Beetlejuice", nil];
  
  _tvArray = [NSMutableArray arrayWithObjects: @"Seinfeld", @"Gilligan's Island", @"The Cosby Show", @"Arrested Development", @"Mork and Mindy", @"GI-Joe", @"Weeds", @"Lost", @"The Twilight Zone", @"24", @"House, M.D.", nil];
  
  _theatreArray = [NSMutableArray arrayWithObjects: @"Death of a Salesman", @"Romeo and Juliet", @"The Book of Mormon", @"Titus Andronicus", @"Neil Patrick Harris", @"The Tony Awards", @"West Side Story", @"Hamlet", @"Stephen Sondheim", @"Jesus Christ Superstar", @"Cat On a Hot Tin Roof", @"Hairspray", @"Pirates of the Carribean", @"Mean Girls", @"Tim Burton", nil];
  
  _musicArray = [NSMutableArray arrayWithObjects: @"Madonna", @"Beethoven", @"Heartbreak Hotel", @"U Can't Touch This", @"Thriller", @"The Sound of Silence", @"I Feel Pretty", @"November Rain", @"Paranoid Android", @"A String Quartet", @"John Cage", @"Nirvana", nil];
  
  _sportsArray = [NSMutableArray arrayWithObjects: @"Babe Ruth", @"Magic Johnson", @"7th Inning Stretch", nil];
 
  _historyArray = [NSMutableArray arrayWithObjects: @"The French Revolution", @"The Cuban Missle Crisis", @"Catherine the Great", nil];
  
  _scienceArray = [NSMutableArray arrayWithObjects: @"The Heisenberg Uncertainty Principle", @"Relativity", @"Jonas Salk", @"Isaac Newton", nil];
  
  _natureArray = [NSMutableArray arrayWithObjects: @"Three-Toed Sloths", @"Mt. Rainier", @"The Grand Canyon", @"The Pacific Ocean", nil];
  
  _geographyArray = [NSMutableArray arrayWithObjects: @"Paris", @"Antarctica", @"Las Vegas", nil];
  
  _artArray = [NSMutableArray arrayWithObjects: @"The Mona Lisa", @"Pablo Picasso", @"Girl With Pearl Earring", nil];
  
  _literatureArray = [NSMutableArray arrayWithObjects: @"A Tale of Two Cities", @"Where the Sidewalk Ends", @"The Hobbit", @"Nausea", nil];
  
  _zanyMiscellanyArray = [NSMutableArray arrayWithObjects: @"42", @"Penguins Playing Golf", @"Insomnia", @"Public Restroom", @"Grumpy Cat", @"Prom Night", @"Cat Fight", @"Mom Jeans", nil];
  
  //add all categories arrays to array of arrays
  [_categoriesArray addObject: _filmArray];
  [_categoriesArray addObject: _tvArray];
  [_categoriesArray addObject: _theatreArray];
  [_categoriesArray addObject: _musicArray];
  [_categoriesArray addObject: _sportsArray];
  [_categoriesArray addObject: _historyArray];
  [_categoriesArray addObject: _scienceArray];
  [_categoriesArray addObject: _natureArray];
  [_categoriesArray addObject: _geographyArray];
  [_categoriesArray addObject: _artArray];
  [_categoriesArray addObject: _literatureArray];
  [_categoriesArray addObject: _zanyMiscellanyArray];
  
  NSLog(@"CATEGORIES ARRAY HAS: %lu", _categoriesArray.count);
  
  NSInteger j = [_categoriesArray count];
  
  NSLog(@"YO AN INT: %li", (long)j);
  

}

//-(NSInteger) randomNumberZeroToTwo {
//  NSInteger randomNumber = (NSInteger) arc4random_uniform(12); // picks between 0 and n-1 where n is 3 in this case, so it will return a result between 0 and 2
//  if ([self.mutableArrayContainingNumbers containsObject: [NSNumber numberWithInteger:randomNumber]]) {
//    [self randomNumberZeroToTwo]; // call the method again and get a new object
//    } else {
//      // end case, it doesn't contain it so you have a number you can use
//      [self.mutableArrayContainingNumbers addObject: [NSNumber numberWithInteger:randomNumber]];
//      return randomNumber;
//    }
//  
//  return true;
//}
//
//-(NSMutableArray *) mutableArrayContainingNumbers
//{
//  if (!_mutableArrayContainingNumbers)
//    _mutableArrayContainingNumbers = [[NSMutableArray alloc] init];
//  
//  return _mutableArrayContainingNumbers;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:@"ShowOptions"])
  {
    ChooseOptionViewController *chooseOptionVC = [segue destinationViewController];
    chooseOptionVC.chosenCategory = self.categoryPressed;
    chooseOptionVC.passedArrayOfOptions = self.selectedArray;
    chooseOptionVC.numberOfPlayers = self.numberOfPlayers;
    chooseOptionVC.durationOfRound = self.durationOfRound;
  }
}


- (IBAction)goBack:(UIButton *)sender {
   [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)category1Pressed:(UIButton *)sender {
  NSLog(@"YOU PRESSED %@", sender.titleLabel.text);
  self.categoryPressed = sender.titleLabel.text;
  self.selectedArray = _filmArray;
 [self performSegueWithIdentifier:@"ShowOptions" sender:self];
}

- (IBAction)category2Pressed:(UIButton *)sender {
  self.categoryPressed = sender.titleLabel.text;
  self.selectedArray = _musicArray;
  [self performSegueWithIdentifier:@"ShowOptions" sender:self];
}
- (IBAction)category3Pressed:(UIButton *)sender {
  self.categoryPressed = sender.titleLabel.text;
  self.selectedArray = _zanyMiscellanyArray;
  [self performSegueWithIdentifier:@"ShowOptions" sender:self];
}

@end

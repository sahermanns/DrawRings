//
//  SketchGuess.h
//  words-drawings
//
//  Created by Kristen Kozmary on 9/24/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Sketch.h"
#import "Guess.h"

@interface SketchGuess : NSObject
@property (strong, nonatomic) Sketch *sketch;
@property (strong, nonatomic) Guess *guess;
@end

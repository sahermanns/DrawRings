//
//  BackgroundGradient.m
//  words-drawings
//
//  Created by Matthew McClure on 9/20/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "BackgroundGradient.h"

@implementation BackgroundGradient


//Metallic grey gradient background
+ (CAGradientLayer*) greyGradient {
  
  UIColor *colorOne = [UIColor colorWithWhite:0.9 alpha:1.0];
  UIColor *colorTwo = [UIColor colorWithHue:0.625 saturation:0.0 brightness:0.85 alpha:1.0];
  UIColor *colorThree     = [UIColor colorWithHue:0.125 saturation:0.0 brightness:0.7 alpha:1.0];
  UIColor *colorFour = [UIColor colorWithHue:0.625 saturation:0.0 brightness:0.4 alpha:1.0];
  
  NSArray *colors =  [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, colorThree.CGColor, colorFour.CGColor, nil];
  
  NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
  NSNumber *stopTwo = [NSNumber numberWithFloat:0.02];
  NSNumber *stopThree     = [NSNumber numberWithFloat:0.99];
  NSNumber *stopFour = [NSNumber numberWithFloat:1.0];
  
  NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, stopThree, stopFour, nil];
  CAGradientLayer *headerLayer = [CAGradientLayer layer];
  headerLayer.colors = colors;
  headerLayer.locations = locations;
  
  return headerLayer;
  
}

//Blue gradient background
+ (CAGradientLayer*) blueGradient {
  
  UIColor *colorOne = [UIColor colorWithRed:(7/255.0) green:(18/255.0) blue:(8/255.0) alpha:1.0];
  UIColor *colorTwo = [UIColor colorWithRed:(157/255.0) green:(168/255.0) blue:(168/255.0) alpha:1.0];
  UIColor *colorThree = [UIColor colorWithRed:(7/255.0) green:(18/255.0) blue:(8/255.0) alpha:1.0];
  
  
  NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, colorThree.CGColor, nil];
  NSNumber *stopOne = [NSNumber numberWithFloat:-2.0];
  NSNumber *stopTwo = [NSNumber numberWithFloat:0.0];
  NSNumber *stopThree = [NSNumber numberWithFloat:3.00];
  
  NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, stopThree, nil];
  
  CAGradientLayer *headerLayer = [CAGradientLayer layer];
  headerLayer.colors = colors;
  headerLayer.locations = locations;
  
  return headerLayer;
  
}

@end

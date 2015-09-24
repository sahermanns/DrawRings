//
//  SouvenirCollectionViewCell.h
//  words-drawings
//
//  Created by Matthew McClure on 9/24/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SouvenirCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *promptLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sketchImage;

@end

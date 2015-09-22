//
//  UIViewToPDF.m
//  words-drawings
//
//  Created by Sarah Hermanns on 9/21/15.
//  Copyright © 2015 Matthew McClure. All rights reserved.
//

#import "UIViewToPDF.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


@implementation UIViewToPDF

-(NSMutableData *)createPDFDatafromUIView:(UIView*)aView
{
    // Creates a mutable data object for updating with binary data, like a byte array
  NSMutableData *pdfData = [NSMutableData data];
  
    // Points the pdf converter to the mutable data object and to the UIView to be converted
  UIGraphicsBeginPDFContextToData(pdfData, aView.bounds, nil);
  UIGraphicsBeginPDFPage();
  CGContextRef pdfContext = UIGraphicsGetCurrentContext();
  
  
    // draws rect to the view and thus this is captured by UIGraphicsBeginPDFContextToData
  
  [aView.layer renderInContext:pdfContext];
  
    // remove PDF rendering context
  UIGraphicsEndPDFContext();
  
  return pdfData;
}


-(NSString*)createPDFfromUIView:(UIView*)aView saveToDocumentsWithFileName:(NSString*)aFilename
{
    // Creates a mutable data object for updating with binary data, like a byte array
  NSMutableData *pdfData = [self createPDFDatafromUIView:aView];
  
    // Retrieves the document directories from the iOS device
  NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
  
  NSString* documentDirectory = [documentDirectories objectAtIndex:0];
  NSString* documentDirectoryFilename = [documentDirectory stringByAppendingPathComponent:aFilename];
  
    // instructs the mutable data object to write its context to a file on disk
  [pdfData writeToFile:documentDirectoryFilename atomically:YES];
  NSLog(@"documentDirectoryFileName: %@",documentDirectoryFilename);
  return documentDirectoryFilename;
}

@end

//
//  Cell.h
//  Lesson2.DNA.II
//
//  Created by DS on 11/6/12.
//  Copyright (c) 2012 DS. All rights reserved.
//

#import <Foundation/Foundation.h>

// Public array contains 4 allowed chars (A,T,G,C)
extern NSArray * allowedCharsArray;

@interface Cell : NSObject

@property NSMutableArray *DNA; // DNA is a property

-(id)init;
-(int) hammingDistance:(Cell*)otherCell;
-(NSString*)asString;
@end

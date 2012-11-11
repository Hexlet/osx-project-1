//
//  Cell.h
//  NDA
//
//  Created by Nestor on 11.11.12.
//  Copyright (c) 2012 Nestor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

-(int) hammingDistance: (Cell *) cell;

@property  NSMutableArray *DNA;
@property  NSArray *letters;

@end

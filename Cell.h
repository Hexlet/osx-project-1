//
//  Cell.h
//  DNA
//
//  Created by Olexandr Skrypnyk on 03.01.13.
//  Copyright (c) 2013 Olexandr Skrypnyk. All rights reserved.
//

#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>

@interface Cell : NSObject

@property NSArray * values;
@property NSMutableArray * DNA;

- (int) hammingDistance: (Cell *) cell;

@end
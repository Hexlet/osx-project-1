//
//  Cell.h
//  hw1
//
//  Created by Пацера on 03.11.12.
//  Copyright (c) 2012 patzera. All rights reserved.
//

#import <Foundation/Foundation.h>
#define MAX_CELL 10

@interface Cell : NSObject
@property NSMutableArray *nda;
@property (readonly) NSArray *arr;

-(int)hammingDistance: (Cell *) cell;

@end

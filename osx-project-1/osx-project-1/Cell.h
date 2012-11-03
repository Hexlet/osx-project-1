//
//  Cell.h
//  osx-project-1
//
//  Created by Igor on 03/11/2012.
//  Copyright (c) 2012 Igor Redchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDNACapacity 100

/*
Represents model of a cell containing DNA symbolic array
*/
@interface Cell : NSObject

/*
Array of symbols representing DNA of the current cell
*/
@property (nonatomic, strong, readonly) NSMutableArray *dna;

/*
Returns hamming distance between current and specified cell: number of DNA positions
for which the cells differ.
*/
- (int) hammingDistance:(Cell *)cell;

@end

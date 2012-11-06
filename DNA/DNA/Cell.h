//
//  Cell.h
//  DNA
//
//  Created by User on 31.10.12.
//  Copyright (c) 2012 Naota. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#define DNA_COUNT 100
#define initDnaItems NSArray* dnaItem = [NSArray arrayWithObjects: @"A",@"T",@"G",@"C",nil]
@interface Cell : NSObject

@property (readonly) NSMutableArray* dna;

- (int)hammingDistance:(Cell*)targetCell;

@end

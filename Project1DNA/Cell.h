//
//  Cell.h
//  Project1DNA
//
//  Created by ky391 on 11/8/12.
//  Copyright (c) 2012 ky391. All rights reserved.
//

#import <Foundation/Foundation.h>

// Cell class
@interface Cell : NSObject
{
    NSMutableArray *aDNA;
    NSMutableArray *aDNAelements;
    NSUInteger iDNAlength;
}

// return Hamming Distance - number of different DNA elements of two cells at the same indexes
-(int) hammingDistance: (Cell *)otherCell;

// return DNA element at requested index
-(NSString *) getDNAatIndex: (NSUInteger) index;

// print DNA sequence
-(void) print;

@end

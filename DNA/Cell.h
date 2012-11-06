//
//  Cell.h
//  DNA
//
//  Created by Roman Zhovnirchyk on 2012-11-04.
//  Copyright (c) 2012 Roman Zhovnirchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    int dnaCapacity; // number of DNA values
}

@property NSMutableArray *dna; // array for DNA values
@property NSArray *possibleDnaValues; // array with possible DNA values

-(int) hammingDistance: (Cell *) cell;

@end

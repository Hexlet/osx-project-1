//
//  Cell.m
//  dna
//
//  Created by Vitaly Larchenkov on 11/9/12.
//  Copyright (c) 2012 Vitaly. All rights reserved.
//

#import "Cell.h"

const int dnaSize = 100;

@implementation Cell
-(id) init {
    self = [super init];
    if (self) {
        NSMutableArray * genes = [[NSMutableArray alloc] initWithObjects:@"A",@"T",@"G",@"C",nil];
        DNA = [[NSMutableArray alloc] initWithCapacity:dnaSize];
        for (int i = 0; i < dnaSize; ++i) {
            int geneNumber = arc4random_uniform(4);
            [DNA setObject:genes[geneNumber] atIndexedSubscript:i];
        }
        NSLog(@"Array: %@", DNA);
    }


    return self;
}
@end
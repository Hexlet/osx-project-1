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
        // NSLog(@"Array: %@", DNA);
    }
    return self;
}
-(int)hammingDistance:(Cell *)sample {
    int difference = 0;
    for (int i = 0; i < dnaSize; ++i) {
        NSLog(@"%i: %@ %@", i, self->DNA[i], sample->DNA[i]);
    }
    if ([DNA isEqualTo:sample->DNA] == NO) {
        for (int i = 0; i < dnaSize; ++i) {
            if (DNA[i] != sample->DNA[i]) {
                ++difference;
            }
        }
    }
    return difference;
}
-(NSMutableArray *)getDna {
    return self->DNA;
}
@end

@implementation Cell (mutator)
-(void)mutate:(int)numberOfMutations{
    
}
@end
//
//  Cell.m
//  DNA
//
//  Created by Vladimir Tsyganov on 01.11.12.
//  Copyright (c) 2012 Vladimir Tsyganov. All rights reserved.
//

#import "Cell.h"

@implementation Cell {
    
}

-(id)init {
    self = [super init];
    if (self) {
        typeOfGen = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
        sizeOfDna = 100;
        srandom((unsigned)time(NULL));
        _dna = [NSMutableArray arrayWithCapacity:sizeOfDna];
        for (int i = 0; i< sizeOfDna; i++) {
            [_dna addObject:[self getRandomGen]];
            }
        }
    return self;
}
-(int)hammingDistance: (Cell *)secondCell{
    int distance = 0;
    for (int i=0; i<sizeOfDna; i++) {
        if ([self.dna objectAtIndex:i]  != [secondCell.dna objectAtIndex:i]) {
            distance++;
        }
    }
    return distance;
}
-(NSString *)getRandomGen{
    srandom((unsigned)time(NULL)+rand());
    return [typeOfGen objectAtIndex:random()%4];
    
}
@end

//
//  Cell.m
//  Learn-osx-project-1
//
//  Created by Mikhail Dudek on 07.11.12.
//  Copyright (c) 2012 Mikhail Dudek. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init {
    if ( (self = [super init]) ) {
        _DNA = [[NSMutableArray alloc] initWithCapacity:kLengthOfDNA];
        for (int i=0; i<kLengthOfDNA; i++) {
            [_DNA addObject: [kLetters objectAtIndex:arc4random_uniform(kLettersCount)]];
        }
        NSLog(@"Cell initialized. DNA: %@",[_DNA componentsJoinedByString:@""]);
    }
    return self;
}

-(int)hammingDistance:(Cell*)aCell {
    int distance = 0;
    for (int i=0; i<_DNA.count && i<aCell.DNA.count; i++) {
        if ([_DNA objectAtIndex:i] != [aCell.DNA objectAtIndex:i]) {
            distance++;
        }
    }
    return distance;
}

@end

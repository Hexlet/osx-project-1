//
//  Cell.m
//  DNA
//
//  Created by Vitaly Dyachkov on 11/4/12.
//  Copyright (c) 2012 Vitaly Dyachkov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init
{
    if (self = [super init]) {
        _DNA = [NSMutableArray arrayWithCapacity:100];
        
        for (int i = 0; i < LENGTH_OF_DNA; i++) {
            // Get radnom base
            char *nucleicAcidBases[4] = {"A", "T", "G", "C"};
            int b = arc4random() % 4;
            
            [self.DNA insertObject:[NSString stringWithUTF8String:nucleicAcidBases[b]]
                      atIndex:i];
        }
    }
    return self;
}

- (int)hammingDistance:(Cell*)cellForComparsion
{
    int distance = 0;
    for (int i = 0; i < LENGTH_OF_DNA; i++) {
        if ([self.DNA objectAtIndex:i] != [cellForComparsion.DNA objectAtIndex:i]) {
            distance++;
        }
    }
    return distance;
}

@end

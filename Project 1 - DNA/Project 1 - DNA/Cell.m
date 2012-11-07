//
//  Cell.m
//  Project 1 - DNA
//
//  Created by Дмитрий Кузнецов on 05.11.12.
//  Copyright (c) 2012 Dmitriy Kuznetsov. All rights reserved.
//

#import "Cell.h"

NSString* const baseDNAElements[] = {@"A",@"T",@"G",@"C"};

@implementation Cell

//Length of DNA Sequence

- (id)init {
    self = [super init];
    if (self) {
        _dna = [[NSMutableArray alloc]initWithCapacity:DNA_LENGTH];
        for (int i=0; i<DNA_LENGTH; i++) {
        [_dna addObject:baseDNAElements[arc4random()%4]];
        }
    }
    return self;
}


-(int)hammingDistance:(Cell *)cell {
    
    int distance = 0;
    
    for (int i=0; i<DNA_LENGTH; i++) {
        if ([_dna objectAtIndex:i] != [cell.dna objectAtIndex:i]) {
            distance++;
        }
    }
    return distance;
}

- (NSString *)printDna {
        return [_dna componentsJoinedByString:@""];
}
@end

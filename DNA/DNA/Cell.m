//
//  Cell.m
//  DNA
//
//  Created by Kirill Ragozin on 10 / 31 / 12.
//  Copyright (c) 2012 Kirill Ragozin. All rights reserved.
//
#import "Cell.h"

@implementation Cell

-(id)init {
    self = [super init];
    DNA = [NSMutableArray arrayWithCapacity:CAPACITY];
    source = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
    NSUInteger index = arc4random() % [source count];
    for (int i=0; i<CAPACITY; i++){
        [DNA addObject:[source objectAtIndex:index]];
        index = arc4random() % [source count];
    }
    return self;
}

-(id)DNA{
    return DNA;
}

-(int)hammingDistance:(Cell *)cell{
    int result = 0;
    for (int i=0; i<DNA.count; i++){
        if ([DNA objectAtIndex:i] != [cell.DNA objectAtIndex:i]) result++;
    }
    return result;
}

+(int)hammingDistanceBetween:(Cell *)cell1 and:(Cell *)cell2{
    return [cell1 hammingDistance:cell2];
}

@end

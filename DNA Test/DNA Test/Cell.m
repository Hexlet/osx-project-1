//
//  DNACell.m
//  DNA Test
//
//  Created by Evgeny Golubev on 30.10.12.
//  Copyright (c) 2012 Evgeny Golubev. All rights reserved.
//

#import "DNACell.h"

@implementation DNACell

-(id) init {
    self = [super init];
    
    if(self){
        _DNATypes = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        _DNA = [NSMutableArray arrayWithCapacity:100];
        for (int i=0; i<100; i++) {
            [_DNA addObject:[_DNATypes objectAtIndex:arc4random_uniform(4)]];
        }
    }
    
    return self;
}

-(int) hammingDistance:(DNACell *)DNAForHamming{
    int hamming = 0;
    
    for (int i=1; i<100; i++) {
        if([_DNA objectAtIndex:i] != [[DNAForHamming DNA] objectAtIndex:i]){
            hamming++;
        }
    }
    
    return hamming;
}

@end
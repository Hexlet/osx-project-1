//
//  Cell.m
//  DNA
//
//  Created by Администратор on 11/6/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import "Cell.h"

@implementation Cell {
    
}

-(id) init {
    if(self = [super init]) {
        NSArray *cDNA = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
        
        _DNA = [NSMutableArray arrayWithCapacity:100];
        
        for (int i = 0; i < 100; i++) {
            [_DNA addObject:[cDNA objectAtIndex:arc4random()%4]];
        }
        
    }
    return self;
}

-(int) hammingDistance:(Cell*)nDNA {
    int hDistance = 0;
    for(int i= 0; i < 100; i++) {
        if ([[nDNA DNA] objectAtIndex:i] != _DNA[i]) {
            //NSLog(@"%@, %@", [[nDNA DNA] objectAtIndex:i], _DNA[i]);
            hDistance++;
        }
    }
    return hDistance;
}

-(void) printDNA {
    for(int i = 0; i<100; i++)
        NSLog(@"%@, %d", _DNA[i], i);
    
}


@end


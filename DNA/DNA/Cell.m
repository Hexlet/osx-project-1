//
//  Cell.m
//  DNA
//
//  Created by Павел Матвиенко on 02.11.12.
//  Copyright (c) 2012 MaMa Creative Studio. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init{
    
    self = [super init];
    if (self) {
        
        _DNA = [[NSMutableArray alloc] init];
        
        int i;
        for (i=0; i<100; i++) {
            
            int rnd = arc4random() % 3;
            if (rnd == 0) [_DNA addObject:[NSString stringWithFormat:@"A"]];
            if (rnd == 1) [_DNA addObject:[NSString stringWithFormat:@"T"]];
            if (rnd == 2) [_DNA addObject:[NSString stringWithFormat:@"G"]];
            if (rnd == 3) [_DNA addObject:[NSString stringWithFormat:@"C"]];
        }
    }
    
    return self;
}

-(int) hammingDistance:(Cell *) cell{
    
    int counter = 0;
    
    int i;
    for (i=0; i<100; i++) {
        
        if ([_DNA objectAtIndex:i] != [cell.DNA objectAtIndex:i]) counter++;
    }
    
    return counter;
}

@end

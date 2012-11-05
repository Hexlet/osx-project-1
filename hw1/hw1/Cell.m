//
//  Cell.m
//  hw1
//
//  Created by stas on 05.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"



@implementation Cell

// Заполнеие массива ДНК
-(id) init {
    
    self = [super init]; 
    if (self) {
        
        NSArray *nucleotide = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        
        DNA = [[NSMutableArray alloc] initWithCapacity: DNA_ARRAY_SIZE];
        for (int i=0; i<DNA_ARRAY_SIZE; i++) {
            [DNA addObject:[nucleotide objectAtIndex:( arc4random() % [nucleotide count])]];
        }
        
    }
    return self;
}

// Расстояние Хэмминга
-(int)hammingDistance:(Cell *)cell {
    
    int distance = 0;
    
    for(int i=0; i<DNA_ARRAY_SIZE; i++) {
        
        // Возможно тут правильнее isEqualToString
        if([DNA objectAtIndex: i] != [cell->DNA objectAtIndex: i]) {
            distance++;
        }
        
        // debug
        // NSLog(@"%@ - %@", [DNA objectAtIndex: i], [cell->DNA objectAtIndex: i]);
    }
    
    return distance;
}


@end

//
//  Cell.m
//  hw1
//
//  Created by Пацера on 03.11.12.
//  Copyright (c) 2012 patzera. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>


@implementation Cell

-(id) init{
    self = [super init];
    
    if (self){
        _arr = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        
        int i;
        _nda = [NSMutableArray arrayWithCapacity:MAX_CELL-1];
        
        for (i=0; i<=MAX_CELL-1; i++){
            [_nda addObject:[_arr objectAtIndex: arc4random() % [_arr count]]];
        }
    }
    return self;
}


-(int)hammingDistance: (Cell *) cell;
{
    int i, count=0;
    
    for (i=0; i<=MAX_CELL-1; i++){
        if ([_nda objectAtIndex:i] != [[cell nda] objectAtIndex:i]) {
            count ++;
        }
    }
    return count;
}


@end

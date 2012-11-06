//
//  Cell.m
//  osx-project-1
//
//  Created by Roman Dolgopolov on 06.11.12.
//  Copyright (c) 2012 Roman Dolgopolov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init{
    
    self = [super init];
    
    if (self) {
        
        _dnaCapacity = 100;
        
        _DNA = [NSMutableArray arrayWithCapacity:_dnaCapacity];

        _Nucleobases = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        
        for (int i = 0; i < _dnaCapacity; i++) {

            NSUInteger randomIndex = arc4random() % [_Nucleobases count];

            [_DNA addObject:[_Nucleobases objectAtIndex:randomIndex]];
            
        }
        
        //NSLog(@"Init values: %@", _DNA);
    }
    
    return self;
}


-(int) hammingDistance:(Cell*) cell{
    
    int distance = 0;
    
    for (int i = 0; i < [_DNA count]; i++) {
        
        if ([self.DNA objectAtIndex:i] != [cell.DNA objectAtIndex:i]) {
            distance++;
        }
        
    }
    
    return distance;
}

@end

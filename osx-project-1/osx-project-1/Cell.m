//
//  Cell.m
//  osx-project-1
//
//  Created by Антон on 11.11.12.
//  Copyright (c) 2012 FerumFlex. All rights reserved.
//

#import "Cell.h"

@implementation Cell
-(id) init {
    self = [super init];
    
    if (self) {
        DNA = [NSMutableArray arrayWithCapacity:100];
        
        for (int i = 0; i<100; i++)
        {
            [DNA addObject:[self getRandomGen]];
        }
    }
    
    return self;
}

-(NSString*) getRandomGen {
    int value = arc4random_uniform(4);
    
    if (value == 0)
        return @"A";
    else if (value == 1)
        return @"T";
    else if (value == 2)
        return @"G";
    else
        return @"C";
}

-(int) hammingDistance:(Cell *)cell {
    int count = 0;
    
    for (int i = 0; i<100; i++)
    {
        if (DNA[i] != cell->DNA[i])
            count = count + 1;
    }
    
    return count;
}
@end

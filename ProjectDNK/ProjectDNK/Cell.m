//
//  Cell.m
//  ProjectDNK
//
//  Created by Сергей Сергеевич on 11.11.12.
//  Copyright (c) 2012 Сергей Сергеевич. All rights reserved.
//

#import "Cell.h"

@implementation Cell
-(id) init {
    self = [super init];
    
    if (self) {
        _DNA = [NSMutableArray arrayWithCapacity:100];
        
        for (int i = 0; i<100; i++)
        {
            [_DNA addObject:[self getRandomGen]];
        }
    }
    
    return self;
}

-(NSString*) getRandomGen {
    int value = arc4random_uniform(4);
    switch (value) {
        case 0:
            return @"A";
            break;
        case 1:
            return @"T";
            break;
        case 2:
            return @"G";
            break;
        case 3:
            return @"C";
            break;
            
        default:
            return @"A";
            break;
    }
}

-(int) hammingDistance:(Cell *)cell {
    int count = 0;
    
    for (int i = 0; i<100; i++)
    {
        if (self.DNA[i] != cell->_DNA[i])
            count = count + 1;
    }
    
    return count;
}
@end

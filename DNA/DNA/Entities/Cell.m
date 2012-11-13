//
//  Cell.m
//  DNA
//
//  Created by Антон Лебедев on 06.11.12.
//  Copyright (c) 2012 Антон Лебедев. All rights reserved.
//

#import "Cell.h"

@implementation Cell

    -(id) init {
        self = [super init];
        if (self) {
            char symbols[4] = {'A', 'T', 'G', 'C'};
            
            _DNA = [[NSMutableArray alloc] init];
            
            int maxLength = 100;
            for (int i = 0; i < maxLength; i++) {
                int index = arc4random()%4;
                NSString* string = [NSString stringWithFormat:@"%c" , symbols[index]];
                [_DNA addObject: string];
            }
        }
        
        return self;
    }

-(int) hammingDistance:(Cell *)compareTo {
    int result = 0;
    for (int i = 0; i < 100; i++) {
        if ([self.DNA objectAtIndex:i] != [compareTo.DNA objectAtIndex:i]) {
            result++;
        }
    }
    
    return result;
}

@end

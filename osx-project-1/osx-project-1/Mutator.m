//
//  Mutator.m
//  osx-project-1
//
//  Created by Sergey Kondratyev on 03.11.12.
//  Copyright (c) 2012 Sergey Kondratyev. All rights reserved.
//

#import "Mutator.h"

@implementation Cell (mutator)

- (void) mutate:(int)m {
    
    NSMutableArray *prc = [NSMutableArray arrayWithCapacity:m];
    
    for (int i = 0;i<m; i++) {
        
        NSNumber *src = [NSNumber numberWithUnsignedLong:arc4random() % 100];
        NSNumber *dst = [NSNumber numberWithUnsignedLong:arc4random() % 100];
        
        if ([prc containsObject:dst]) {
            continue;
        }
        
        NSString *str = [DNA objectAtIndex:[src unsignedLongValue]];
        
        [DNA replaceObjectAtIndex:[dst unsignedLongValue] withObject:str];
        
        [prc addObject:dst];
        
    }
}
@end


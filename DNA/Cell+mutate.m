//
//  Cell+mutate.m
//  DNA
//
//  Created by ilya on 11/3/12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "Cell+mutate.h"

@implementation Cell (mutate)
 
- (void) mutate: (int)percent {
    
    if(percent > 100){
        percent = 100;
    }
    
    int i;
    NSMutableArray *changedPositions = [[NSMutableArray alloc] init];
    NSString *index, *gen;
    
    for(i = 0; i < percent; i++){
        index = [NSString stringWithFormat: @"%d", arc4random() % percent];
        
        if(changedPositions.count <= 0){
            [changedPositions addObject: index];
        } else if([changedPositions indexOfObject:index] > changedPositions.count){
           [changedPositions addObject: index];
        } else {
            i--;
        }
    }
    
    for (i = 0; i < changedPositions.count; i++) {        
        gen = [self findGenNot:[self.DNA objectAtIndex:[changedPositions[i] integerValue]]];
        [self.DNA insertObject:gen atIndex: [changedPositions[i] integerValue]];
    }
    
}

@end

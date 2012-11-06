//
//  Mutator.m
//  DNK
//
//  Created by p.naumov on 05.11.12.
//  Copyright (c) 2012 p.naumov. All rights reserved.
//

#import "Mutator.h"

@implementation Cell (Mutator)


-(void)mutate:(int)percent {
    NSMutableArray *index = [[NSMutableArray alloc] init];
    for (int i = 0; i < percent; i++) {
        
        int randomIndex = arc4random() % DNA_LENGHT;
        
        if ([index containsObject:[NSNumber numberWithInt:randomIndex]]) {
            i--;
        }
        else {
            [index addObject:[NSNumber numberWithInt:randomIndex]];
            [DNA replaceObjectAtIndex:randomIndex withObject:[genes objectAtIndex:(0 + arc4random()%4)]];
        }
    }

}


@end



//
//  Cell+mutator.m
//  DNA
//
//  Created by Алексей Потемкин on 13.11.12.
//  Copyright (c) 2012 Алексей Потемкин. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void)mutate:(int)percent{
    
    for (int i = 0; i < percent; ++i) {
        [self.DNA insertObject:[self.characters objectAtIndex:arc4random() % 4] atIndex:i];
    }
    
}

@end

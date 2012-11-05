//
//  Cell+mutator.m
//  dna
//
//  Created by Konstantin Tumalevich on 01.11.12.
//  Copyright (c) 2012 Konstantin Tumalevich. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
- (void) mutate:(int)percent {
    NSAssert((percent > 0) && (percent <= 100), @"Invalid percent");
    
    NSUInteger count = lround(percent / 100.0 * DNA_SIZE);
    
    NSMutableArray *indexes = [NSMutableArray arrayWithCapacity:DNA_SIZE];
    
    for (NSUInteger i=0; i<DNA_SIZE; i++) {
        [indexes addObject:@(i)];
    }
    
    for (NSUInteger changed=0; changed < count; changed++) {
        NSUInteger change_index = arc4random() % [indexes count];
        NSUInteger change_index_value = [indexes[change_index] integerValue];
        NSString *old_code = self.dna[change_index_value];
        NSString *new_code = [self getCode:old_code];
        [self.dna replaceObjectAtIndex:change_index_value withObject:new_code];
        [indexes removeObjectAtIndex:change_index];
        
    }
}
@end

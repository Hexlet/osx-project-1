//
//  Cell+mutator.m
//  HW1-DNA
//
//  Created by Victor Gafiatulin on 05.11.12.
//  Copyright (c) 2012 Victor Gafiatulin. All rights reserved.
//

#import "Cell+mutator.h"


@implementation Cell (mutator)
-(void)mutate: (int)mutationRate
{
    NSAssert((mutationRate >= 0) && (mutationRate <= 100), @"MutationRate ∉ [0,100]");
    static NSMutableArray *arrShuffle = nil;
    if(!arrShuffle){
        arrShuffle = [[NSMutableArray alloc] initWithCapacity:capacity];
        for(int i = 0; i < capacity; i++)
        {
            [arrShuffle addObject: [NSNumber numberWithInt: i]];
        }
    }
    [arrShuffle shuffle];
    for (int i = 0; i< capacity*mutationRate/100; i++)
    {
        NSMutableArray *tmp2 = [self.nucleobase mutableCopy];
        [tmp2 removeObject: [self->DNA objectAtIndex:[[arrShuffle objectAtIndex: i] integerValue]]];
        [tmp2 shuffle];
        [self->DNA replaceObjectAtIndex: [[arrShuffle objectAtIndex: i] integerValue]
                            withObject: [tmp2 objectAtIndex: 0]];
    }
}

@end

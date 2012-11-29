//
//  NSObject+Cell_mutator.m
//  DNA
//
//  Created by Сергей Греков on 29.11.12.
//  Copyright (c) 2012 Сергей Греков. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell(mutator)

-(void)mutate:(int)percent{
    NSAssert((percent >= 0 && percent <= 100), @"Invalid pecents:%d",percent);
    int x = percent *( DNA_LEN / 100);
    NSMutableDictionary * usedIndexes = [[NSMutableDictionary alloc] init];
    for (int i = 0; i <= x; i++){
        int randomEl;
        do{
            randomEl = arc4random_uniform([self.DNA count]);
            //randomElStr = [NSString stringWithFormat:@"%d",randomEl];
        }while ([usedIndexes objectForKey:[NSNumber numberWithInt:randomEl]]);
        [usedIndexes setValue:@"ELEMENT_EXIST" forKey:[NSNumber numberWithInt:randomEl]];
        int randomLetter;
        do{
            randomLetter = arc4random_uniform(4);
        }while ([[dict objectAtIndex:randomLetter] isEqualToString:[self.DNA objectAtIndex:randomEl]]);
        [self.DNA replaceObjectAtIndex:randomEl withObject:[dict objectAtIndex:randomLetter]];
    }
}


@end

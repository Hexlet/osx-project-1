//
//  Cell+Mutator.m
//  DNAProject
//
//  Created by Valery Kharshats on 11/4/12.
//  Copyright (c) 2012 Valery Kharshats. All rights reserved.
//

#import "Cell+Mutator.h"
#import "NSMutableArray+Shuffling.h"
#define DNA_LENGTH 100
@implementation Cell (Mutator)


-(void) mutate: (int) howPercent {
    NSInteger howMuch = (floor(DNA_LENGTH / 100)) * howPercent;
    NSMutableArray *mutatorIndexes = [NSMutableArray array];
    for (NSInteger i = 0; i < DNA_LENGTH; i++) {
        [mutatorIndexes addObject:[NSNumber numberWithInteger:i]];
    }
    [mutatorIndexes shuffle];
    NSInteger index;
    NSString *oldElement;
    for (int i = 0; i < howMuch; i++) {
        index = [[mutatorIndexes objectAtIndex:i] integerValue];
//        NSLog(@"Index %li", index);
//        NSLog(@"DNA element before %@", [_DNA objectAtIndex:index]);
        oldElement = [_DNA objectAtIndex:index];
        [_DNA replaceObjectAtIndex: index withObject:[self generateNewElement:oldElement]];
//        NSLog(@"DNA element after %@", [_DNA objectAtIndex:index]);
    }
}

-(NSString*) generateNewElement: (NSString*) oldElement {
    Boolean mutationSuccess = NO;
    NSString *newElement;
    while (!mutationSuccess) {
        newElement = [self generateElement];
        if (newElement != oldElement) {
            mutationSuccess = YES;
        }
    }
    return newElement;
}

@end

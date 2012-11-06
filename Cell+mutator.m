//
//  NSObject+mutator.m
//  DNAProject
//
//  Created by Andrew on 06.11.12.
//  Copyright (c) 2012 AndrewVanyurin. All rights reserved.
//

#import "Cell+mutator.h"

extern NSArray const *ATGC;

@implementation Cell (mutator)

- (void)mutate:(int) percentM{
    if ((percentM < 0) || (percentM >100)) {
        NSException *e = [NSException exceptionWithName:@"WrongNumberPercent" reason:@"Wrong Number Percent" userInfo:nil];
        @throw e;
    }
    
    NSMutableSet *indexesForMutationSet = [NSMutableSet set];
    
    while ([indexesForMutationSet count]<percentM) {
        [indexesForMutationSet addObject:[NSNumber numberWithInt:arc4random()%[[self DNA] count]]];
    }
    
    NSMutableArray *indexesForMutationArr = [NSMutableArray  arrayWithArray:[indexesForMutationSet allObjects]];
    
    for (int i = 0 ; i < percentM; i++) {
        int index = arc4random()%[ATGC count];
        while (([[[self DNA] objectAtIndex:[[indexesForMutationArr objectAtIndex:i] intValue]] isEqual: [ATGC objectAtIndex:index]])) {
                index = arc4random()%[ATGC count];
        }
        [[self DNA] replaceObjectAtIndex:[[indexesForMutationArr objectAtIndex:i] intValue] withObject:[ATGC objectAtIndex:index]];
    }
}
@end


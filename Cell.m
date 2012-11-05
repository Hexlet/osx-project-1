//
//  Cell.m
//  DNAProject
//
//  Created by Andrew on 30.10.12.
//  Copyright (c) 2012 AndrewVanyurin. All rights reserved.
//

#import "Cell.h"

extern NSArray const *ATGC;

@implementation Cell

- (id)init{
    
    self = [super init];
    if (self) {
        _DNA = [NSMutableArray arrayWithCapacity:100];
        for (int i=0; i<100; i++) {
            [[self DNA] addObject:[ATGC objectAtIndex:(arc4random()%[ATGC count])]];
        }
    }
    return self;
}

-(int) hammingDistance: (Cell *)c{
    int rez = 0;
    
    for (NSUInteger i = 0; i < [[self DNA] count]; i++) {
        if (![[[self DNA] objectAtIndex:i] isEqual: [[c DNA] objectAtIndex:i]]) {
            rez++;
        }
    }

    return rez;
}

@end

@implementation Cell (mutator)

- (void)mutate:(int) percentM{   
    if ((percentM < 0) || (percentM >100)) {
        NSException *e = [NSException exceptionWithName:@"WrongNumberPercent" reason:@"Wrong Number Percent" userInfo:nil];
        @throw e;
    }

    NSMutableSet *indexes = [NSMutableSet set];
    for (int i = 0 ; i <= percentM; i++) {
        int index1 = arc4random()%[[self DNA] count];
        int index2 = arc4random()%[ATGC count];
        
        while (([indexes containsObject:[NSNumber numberWithInt:index1]])) {
            index1 = arc4random()%[ATGC count];
        }
        while (([[[self DNA] objectAtIndex:index1] isEqual: [ATGC objectAtIndex:index2]])) {
            index2 = arc4random()%[ATGC count];
        }
        
        [[self DNA] replaceObjectAtIndex:index1 withObject:[ATGC objectAtIndex:index2]];
        [indexes addObject:[NSNumber numberWithInt: index1]];
    }
}
@end



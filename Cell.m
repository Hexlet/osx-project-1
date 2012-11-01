//
//  Cell.m
//  DNAProject
//
//  Created by Andrew on 30.10.12.
//  Copyright (c) 2012 AndrewVanyurin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init{
    
    ATGC= @[@"A", @"T", @"G", @"C"];
    
    self = [super init];
    if (self) {
        _DNA = [NSMutableArray arrayWithCapacity:100];
        for (int i=1; i<=100; i++) {
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
    else{
        for (int i = 1 ; i <= percentM; i++) {
            int index1 = arc4random()%[[self DNA] count];
            int index2 = arc4random()%[ATGC count];
            while ([[[self DNA] objectAtIndex:index1] isEqual: [ATGC objectAtIndex:index2]]) {
                index2 = arc4random()%[ATGC count];
            }
            [[self DNA] replaceObjectAtIndex:index1 withObject:[ATGC objectAtIndex:index2]];
        }
    }
}
@end



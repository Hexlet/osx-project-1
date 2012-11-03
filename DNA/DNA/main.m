//
//  main.m
//  DNA
//
//  Created by Makarenko Vitali on 03.11.12.
//  Copyright (c) 2012 Makarenko Vitali. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
@interface Cell(mutator)
- (void)mutate:(int)percent;
@end
@implementation Cell (mutator)
- (void)mutate:(int)percent {
    NSMutableArray *elementIndex = [NSMutableArray array];
    NSNumber *index = [NSNumber numberWithInt:0];
    do {
        index = [NSNumber numberWithInt:(arc4random() % COUNT)];
        if ([elementIndex indexOfObject:index] == NSNotFound) {
            [elementIndex addObject:index];
        }
    } while (percent > [elementIndex count]);
    for (NSInteger i = 0; i<percent; i++) {
        [[self DNA] replaceObjectAtIndex:[[elementIndex objectAtIndex:i] integerValue]
                              withObject:[DNA_ELEMENTS objectAtIndex:(arc4random() % [DNA_ELEMENTS count])]];
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"hamming distance =  %d", [cell1 hammingDistance:cell2]);
        NSLog(@"Mutate...");
        [cell1 mutate:22];
        [cell2 mutate:56];
        NSLog(@"hamming distance =  %d", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


//
//  Cell+CellMutator.m
//  DNA
//
//  Created by Arkadiy Pikalov on 11/04/12.
//  Copyright (c) 2012 Arkadiy Pikalov. All rights reserved.
//

#import "Cell+CellMutator.h"

@implementation Cell (CellMutator)
-(void) mutate: (int)percent
{
    NSMutableArray* array = [self makeOrderedArrayWithSize:CELL_SIZE];
    [self shuffle:array];
    int count = (percent*CELL_SIZE)/100;
    int counter = 0;
    for(NSNumber *position in array)
    {
        int pos = [position intValue];
        int new = [self mutateDNAItem:pos];
        [[self dna] replaceObjectAtIndex:pos withObject:[NSNumber numberWithInt:new]];

        counter++;
        if(counter == count)
            break;
    }
}

-(int) mutateDNAItem:(int) pos
{
    int old = [[[self dna] objectAtIndex:pos] intValue];
    int new = old;
    do {
        new = arc4random()%4;
    } while (new == old);
    return new;
}

-(NSMutableArray*) makeOrderedArrayWithSize:(int) size
{
    NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:size];
    for(int i=0;i<size;i++)
        [array addObject:[NSNumber numberWithInt:i]];
    return array;
}
- (void)shuffle:(NSMutableArray*) array
{
    NSInteger count = [array count];
    for (NSUInteger i = 0; i < CELL_SIZE; ++i) {
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [array exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}
@end

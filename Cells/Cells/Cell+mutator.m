//
//  Cell+mutator.m
//  Cells
//
//  Created by Vladimir Korshunov on 11/5/12.
//  Copyright (c) 2012 Vladimir Korshunov. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
// Мутация «ДНК»
- (void) mutate:(int)persent {
    if (persent > 100 && persent < 0){
        NSLog(@"Error: bad value");
        return ;
    }
    
    int count = round([DNA count] * persent / 100);
    
    NSArray *Genome = [NSArray arrayWithObjects:@"A", @"C", @"G", @"T", nil];
    
    Cell *MutableDNA = [[Cell alloc] initWithArray:DNA];
    while (count > [self hammingDistance:MutableDNA]) {
        [DNA replaceObjectAtIndex:(arc4random() % [DNA count]) withObject:[Genome objectAtIndex:arc4random() % 4]];
    }
}
@end

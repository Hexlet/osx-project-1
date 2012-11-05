//
//  Cell+Mutator.m
//  DNA
//
//  Created by Aliaksandr Minets on 11/5/12.
//  Copyright (c) 2012 minchik. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate:(int)f{
    NSNumber *cell_to_modify = 0;
    NSMutableSet * modifiedCells = [[NSMutableSet alloc] init];
    NSString *curr_cell_name = [[NSString alloc]init];
    while (f!=0) {
        cell_to_modify = [NSNumber numberWithInt:(arc4random() % 100)];
        if ([modifiedCells containsObject:cell_to_modify]){
            continue;
        }
        [modifiedCells addObject:cell_to_modify];
        f -= 1;
        curr_cell_name = [Cell getRandomCellType];
        while ([curr_cell_name isEqualToString:[dna objectAtIndex:[cell_to_modify intValue]]]){
            
            curr_cell_name = [Cell getRandomCellType];
            
        }
        [dna replaceObjectAtIndex:[cell_to_modify intValue] withObject:curr_cell_name];
        
    }
}

@end
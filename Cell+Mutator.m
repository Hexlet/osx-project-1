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
    int percent_to_number = [dna count]*f/100;
    NSNumber *cell_to_modify = 0;
    NSMutableSet * modifiedCells = [[NSMutableSet alloc] init];
    NSString *curr_cell_name = [[NSString alloc]init];
    while (percent_to_number!=0) {
        cell_to_modify = [NSNumber numberWithInt:(arc4random() % 100)];
        if ([modifiedCells containsObject:cell_to_modify]){
            continue;
        }
        [modifiedCells addObject:cell_to_modify];
        percent_to_number -= 1;
        curr_cell_name = [Cell getRandomCellType];
        while ([curr_cell_name isEqualToString:[dna objectAtIndex:[cell_to_modify intValue]]]){
            
            curr_cell_name = [Cell getRandomCellType];
            
        }
        [dna replaceObjectAtIndex:[cell_to_modify intValue] withObject:curr_cell_name];
        
    }
}

@end
//
//  Cell.m
//  DNA
//
//  Created by Aliaksandr Minets on 10/31/12.
//  Copyright (c) 2012 minchik. All rights reserved.
//

#import "Cell.h"

@implementation Cell


-(id) init {
    
    
    dna = [[NSMutableArray alloc] init];
    
    
    self = [super init];
    
    if (self){
        
        for (int i = 0; i < 100; i++){
            
            [dna addObject:[Cell getRandomCellType]];
            
        }
            }
    return self;
}


-(NSMutableArray *) getDna{
    return dna;
}

-(int) hammingDistance:(Cell *)f{
    int difference = 0;
    int i = 0;
    
    while (i < [dna count]) {
        if ([dna objectAtIndex:i] != [[f getDna] objectAtIndex:i]) {
            difference++;
        }
        i++;
    }
    return difference;
}


+(NSString *)getRandomCellType{
    //Random cell initialization
    
    int curr_cell_type;
    NSString *curr_cell_name = [[NSString alloc] init];
    
    curr_cell_type = arc4random() % 4;
    
    switch (curr_cell_type) {
        case 0:
            curr_cell_name = @"A";
            break;
        case 1:
            curr_cell_name = @"T";
            break;
        case 2:
            curr_cell_name = @"G";
            break;
        default:
            curr_cell_name = @"C";
            break;
    }
    
    return curr_cell_name;

    
}

@end

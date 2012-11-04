//
//  Cell+Mutator.m
//  DNA
//
//  Created by Gennadii Lukash on 11/4/12.
//  Copyright (c) 2012 GL. All rights reserved.
//

#import "Cell+Mutator.h"


@implementation Cell(Mutator)

-(void)mutate:(int)percent{
    NSMutableArray *indexBox = [[NSMutableArray alloc] init];
    
    if (percent > 0 && percent <= 100) {
        for (int i = 0; i < percent; i++) {
            
            //Generation random index
            int random_index = arc4random() % LENGHT_DNA_ARRAY;
            
            //If this index was replaced, need take fresh
            while ([indexBox containsObject:[NSString stringWithFormat: @"%d", random_index]]) {
                random_index = arc4random() % LENGHT_DNA_ARRAY;
            }
            //Add replaced index to count array
            [indexBox addObject:[NSString stringWithFormat: @"%d", random_index]];
            
            //Generate new symbol for DNA
            NSString *symbol = [CHARS_DNA objectAtIndex: arc4random()%4 ];
            
            //Need take another symbol
            while ([self.DNA objectAtIndex:random_index] == symbol) {
                symbol = [CHARS_DNA objectAtIndex: arc4random()%4 ];
            }
            
            //Add to DNA mutated object
            [self.DNA replaceObjectAtIndex:random_index withObject:symbol];
        }
    } else{
        NSLog(@"Type percent in range 1..100");
    }
    
}

@end
//
//  Cell+Mutator.m
//  task_1_dna
//
//  Created by Sergey Sh on 07.11.12.
//  Copyright (c) 2012 Sergey Sh. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate:(int) x {
    int countOfMutation;
    int numberOf;
    
    NSMutableArray *mutationIndex;
    
    countOfMutation = (int) (self.count * x) / 100;
    NSLog(@"countOfMutation = %i", countOfMutation);
    
    mutationIndex = [[NSMutableArray alloc] init];
    
    
    // подготовка индексов массива мутаций

    for (int i = 0; i < countOfMutation; i++) {

        do {
            numberOf = (random() % (self.count));
        } while ([mutationIndex containsObject:[NSNumber numberWithInt: numberOf]]);
        
        [mutationIndex addObject: [NSNumber numberWithInt: numberOf]];
        
        NSLog(@"mutation Index = %i", numberOf);
        
        [[self DNA] replaceObjectAtIndex: numberOf withObject: [self getUnit]];
    }
  
}

@end
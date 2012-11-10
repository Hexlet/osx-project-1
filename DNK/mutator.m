//
//  mutator.m
//  DNK
//
//  Created by flom on 30.10.12.
//  Copyright (c) 2012 flom. All rights reserved.
//

#import "mutator.h"

@implementation Cell (mutator)

-(void)mutate:(int)percent{
    int mutations = percent * 0.01 * self.dna.count;
    if(mutations == 0)  return;
    
    NSArray *alphabet = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C",nil];
    
    for(int mutation=0;mutation<mutations;mutation++)
    {
        int randomPlace = arc4random() % (int)self.dna.count;
        int randomMutation = arc4random() % 4;
        NSLog(@"%i %i", randomPlace, randomMutation);
        
        
        [self.dna replaceObjectAtIndex:randomPlace withObject:[alphabet objectAtIndex:randomMutation]];
        
    }
    
}

@end

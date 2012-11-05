//
//  Cell+mutator.m
//  DNA
//
//  Created by Dm on 11/3/12.
//  Copyright (c) 2012 Dm. All rights reserved.
//

#import "Cell+mutator.h"
#import "NSMutableArray+Shuffling.h"

@implementation Cell (mutator)
-(void) mutate:(int)viruses {
    
    
    NSMutableArray *randomBase = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [[self dna] count]; i++) {
        NSNumber *number = [[NSNumber alloc] initWithInteger:i];
        [randomBase addObject:number];
    }
    
    [randomBase shuffle];
    
    for (int i = 0; i < viruses; i++) {
        
        int randomBaseNumber = [[randomBase objectAtIndex:i] intValue];
        id randomBaseObject = [[self dna] objectAtIndex:randomBaseNumber];
        
        int randomNucleoNumber = arc4random() % [[self nucleobase] count];
        id randomNucleoObject = [[self nucleobase] objectAtIndex:randomNucleoNumber];
        
        if ([randomBaseObject isEqual:randomNucleoObject]) {
            NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:[self nucleobase]];
            [temp removeObject:randomBaseObject];
            [
             [self dna]
                replaceObjectAtIndex:randomBaseNumber
                withObject:[temp objectAtIndex:arc4random() % [temp count]]
             ];
        } else {
            [
             [self dna]
                replaceObjectAtIndex:randomBaseNumber
                withObject:randomNucleoObject
             ];
        }

    }
//    NSLog(@"self dna %@",[self dna]);
}
@end

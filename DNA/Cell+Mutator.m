//
//  Cell+Mutator.m
//  DNA
//
//  Created by Alexander Madyankin on 04.11.12.
//  Copyright (c) 2012 Alexander Madyankin. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

- (void) mutate: (int) percent {
    int capacity = [self capacity];
    percent = round(capacity / 100 * percent);
    NSMutableArray *mutatedBases = [[NSMutableArray alloc] initWithCapacity: capacity];
    
    for (int i = 0; i < capacity; i++) {
        mutatedBases[i] = [NSNumber numberWithBool: NO];
    }
    
    for (int i = 0; i < percent; i++) {
        int index           = arc4random() % capacity;
        NSMutableArray *dna = [self dna];
        NSString *newBase   = [Cell randomBase];
        
        if ([mutatedBases[index] boolValue] || newBase == dna[index]) continue;
        
        dna[index] = newBase;
        mutatedBases[index] = [NSNumber numberWithBool: YES];
        i++;
    }
}

@end
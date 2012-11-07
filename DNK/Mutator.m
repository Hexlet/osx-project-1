//
//  Mutator.m
//  DNK
//
//  Created by p.naumov on 05.11.12.
//  Copyright (c) 2012 p.naumov. All rights reserved.
//

#import "Mutator.h"

@implementation Cell (Mutator)


-(void)mutate:(int)percent {
    
    if (percent < 0 && percent > 100)
    {
        NSLog(@"Error 0 to 100");
        return;
    }
    
    NSUInteger mutateGenesCount = [self . DNA count] *percent / 100;
    NSMutableArray *mutateGenes = [NSMutableArray arrayWithCapacity:mutateGenesCount];
    
    for (NSUInteger i = 0;  i < mutateGenesCount; i++) {
        NSNumber *index;
        
        do {
            index = [NSNumber numberWithInt:rand() % [self . DNA count]];
        } while ([mutateGenes containsObject:index]);
        
        [mutateGenes addObject:index];

        NSString* newelement;
        do {
            newelement = [Cell randomElement];
        } while ([self . DNA objectAtIndex:[index unsignedIntegerValue]]==newelement);

        [self . DNA replaceObjectAtIndex:[index unsignedIntegerValue] withObject:newelement];
    }
}

@end

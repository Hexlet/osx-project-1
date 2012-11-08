//
//  Cell.m
//  homeWorkDNA
//
//  Created by Mac on 04.11.12.
//  Copyright (c) 2012 Mac. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        dna = [NSMutableArray arrayWithCapacity:100];
        elDna = [NSArray arrayWithObjects:@"A", @"C", @"G", @"T", nil];
        for (int i = 0; i < 100; i++){
            NSUInteger n = arc4random() % 4;
            [dna addObject:[elDna objectAtIndex:n]];
        }
    }
    
    return self;
}

-(int) hammingDistance:(Cell *) c {
    int hammDistanse = 0;
    NSLog(@"SElF    OTHER");
    for(NSUInteger i = 0; i < 100; i++){
        if (![[self->dna objectAtIndex:i] isEqualToString: [c->dna objectAtIndex:i]] ) {
            hammDistanse++;
            NSLog(@"%@    %@  ",[self->dna objectAtIndex:i], [c->dna objectAtIndex:i]);
        }
    }
    return hammDistanse;
}



@end

//
//  Cell+mutator.m
//  DNA
//
//  Created by Dmitry Davidov on 06.11.12.
//  Copyright (c) 2012 Dmitry Davidov. All rights reserved.
//

#import "Cell+mutator.h"

#import "NucleotideGenerator.h"

@implementation Cell (Mutator)

-(void) mutate: (int) rate {
    if (rate < 0 || rate > 100)
        @throw [NSException exceptionWithName:@"CellException" reason:@"Wrong rate value." userInfo:nil];
    
    int portion = round([self->DNA count] * rate / 100.0f);
    
    for (int i = 0; i < portion; ++i)
        [self->DNA exchangeObjectAtIndex: i withObjectAtIndex: i + arc4random() % ([self->DNA count] - i)];
    
    for (int i = 0; i < portion; ++i)
        [self->DNA replaceObjectAtIndex: i withObject: [NucleotideGenerator getRandomExcept: [self->DNA objectAtIndex: i]]];
}

@end
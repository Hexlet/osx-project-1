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

- (void)mutate:(int)percent {
    if (percent < 0 || percent > 100)
        @throw [NSException exceptionWithName:@"CellException" reason:@"Wrong rate value." userInfo:nil];
    
    int portion = round([self->DNA count] * percent / 100.0f);
    
    static NSMutableArray *indexes;
    
    if (indexes == nil || [indexes count] != [DNA count]) {
        indexes = [NSMutableArray array];
        for (int i = 0; i < [DNA count]; ++i)
            [indexes addObject:[NSNumber numberWithInt:i]];
    }
    
    for (int i = 0; i < portion; ++i)
        [indexes exchangeObjectAtIndex:i withObjectAtIndex:i + arc4random() % ([DNA count] - i)];
    
    for (int i = 0; i < portion; ++i)
        [DNA replaceObjectAtIndex:[[indexes objectAtIndex:i] integerValue]  withObject: [NucleotideGenerator getRandomExcept: [DNA objectAtIndex: i]]];
}

@end
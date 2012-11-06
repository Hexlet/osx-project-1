//
//  Cell.m
//  DNA
//
//  Created by Dmitry Davidov on 04.11.12.
//  Copyright (c) 2012 Dmitry Davidov. All rights reserved.
//

#import "Cell.h"

#import "NucleotideGenerator.h"

@implementation Cell

static int DNA_LENGTH = 100;

-(id) init {
    self = [super init];
    if (self) {
        DNA = [NSMutableArray arrayWithCapacity: DNA_LENGTH];
        
        for (int i = 0; i < DNA_LENGTH; ++i)
            [DNA addObject: [NucleotideGenerator getRandom]];
        
    }
    return self;
}

-(int) hammingDistance:(Cell *)cell {
    if ([DNA count] != [cell->DNA count])
        @throw [NSException exceptionWithName:@"CellException" reason:@"DNA lengths aren't equal." userInfo:nil];
    
    int diff = 0;
    for (int i = 0; i < [DNA count]; ++i) {
//        NSLog(@"%@ - %@ -> ", [DNA objectAtIndex:i], [cell->DNA objectAtIndex:i]);
        if ([DNA objectAtIndex:i] != [cell->DNA objectAtIndex:i]) {
            ++diff;
//            NSLog(@"ne");
        }
//        else {
//            NSLog(@"eq");
//        }
    }
    return diff;
}

-(void) print {
    NSLog(@"%@", DNA);
}

@end

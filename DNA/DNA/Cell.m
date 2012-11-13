//
//  Cell.m
//  DNA
//
//  Created by Anton Platonov on 7.11.12.
//  Copyright (c) 2012 Anton Platonov. All rights reserved.
//

#import <stdlib.h>

#import "Cell.h"


// Набор символов ДНК
NSString * DNASymbols[] = { @"A", @"T", @"G", @"C" };


@implementation Cell


+(NSString *)randomDNASymbol
{
    return DNASymbols[ random() % 4 ];
}

-(id)init
{
    self = [super init];
    
    // Создание ДНК
    _DNA = [NSMutableArray arrayWithCapacity:CELL_DNA_LENGTH];
    
    // Заполнение ДНК
    srandomdev();
    for (int i=0; i<CELL_DNA_LENGTH; i++) {
        [_DNA addObject:[[self class] randomDNASymbol]];
    }
    
    return self;
}

-(int)hammingDistance:(Cell *)otherCell
{
    int distance = 0;
    
    NSMutableArray * myDNA = [self DNA];
    NSMutableArray * otherDNA = [otherCell DNA];
    
    for (int i=0; i<CELL_DNA_LENGTH; i++) {
        if ([myDNA objectAtIndex:i] != [otherDNA objectAtIndex:i]) {
            distance++;
        }
    }
    
    return distance;
}

@end

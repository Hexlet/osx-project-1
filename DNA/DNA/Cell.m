//
//  Cell.m
//  DNA
//
//  Created by IBEC IBEC on 10/31/12.
//  Copyright (c) 2012 IBEC IBEC. All rights reserved.
//

#import "Cell.h"
#import <stdlib.h>

#define DNA_LENGTH 100   // Длина массива ДНК

@implementation Cell

- (id)init
{
    self = [super init];
    if (self)
    {
        _DNALength = DNA_LENGTH;
        _DNA = [[NSMutableArray alloc] init];
        _DNAs = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        for (int i = 0; i < _DNALength; i++) {
            [_DNA addObject:[_DNAs objectAtIndex:arc4random()%[_DNAs count]]];
        }
    }
    return self;
}

- (int)hammingDistance:(Cell *)cell  // Расчет отклонения
{
    int hammingDistanceCount = 0;
    for (int i = 0; i < [_DNA count]; i++) {
        if (![[_DNA objectAtIndex:i] isEqual:[cell.DNA objectAtIndex:i]])
        {
            hammingDistanceCount++;
        }
    }
    return hammingDistanceCount;
}

- (void)printDNA  // Вывод ДНК в читаемом виде
{
    NSMutableString *dnaStr = [[NSMutableString alloc] init];
    for (NSString *str in _DNA)
    {
        [dnaStr appendString:str];
    }
    NSLog(@"%@", dnaStr);
}

@end

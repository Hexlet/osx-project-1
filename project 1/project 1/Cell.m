//
//  Cell.m
//  project 1
//
//  Created by Dmitriy Zhukov on 11/6/12.
//  Copyright (c) 2012 Dmitriy Zhukov. All rights reserved.
//

#import "Cell.h"

const NSUInteger DNALength = 100;


@implementation Cell

- (id)init
{
    self = [super init];
    if (self)
    {
        DNA = [NSMutableArray arrayWithCapacity:DNALength];
        
        for (int i = 0; i < DNALength; i++)
        {
            [DNA addObject:[Cell randomGene]];
        }
    }
    return self;
}

+ (NSString *)randomGene
{
    NSArray * const allowedGenes = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    return allowedGenes[rand() % allowedGenes.count];
}

- (int)hammingDistance:(Cell *)anotherCell
{
    int difference = 0;
    for (NSUInteger i = 0; i < DNALength; i++)
    {
        NSString *gene = [DNA objectAtIndex:i];
        NSString *anotherCellGene = [anotherCell->DNA objectAtIndex:i];
        
        if (![gene isEqualToString:anotherCellGene])
        {
            difference++;
        }
    }
    
    return difference;
}

- (NSString *)description
{
    return [DNA componentsJoinedByString:@""];
}

@end

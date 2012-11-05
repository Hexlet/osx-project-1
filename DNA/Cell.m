//
//  Cell.m
//  DNA
//
//  Created by Andrey Shemanovskiy on 05.11.12.
//  Copyright (c) 2012 andrey.shemanovskiy. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init
{
    self = [super init];
    
    if (self){
        _codonArray = [[NSArray alloc] initWithObjects:@"A", @"G", @"C", @"T", nil];
        _dna = [[NSMutableArray alloc] initWithCapacity:100];
        _dna = [self getRandomDNAForEmptyArray:_dna];
    }
    
    return self;
}

- (NSMutableArray *)getRandomDNAForEmptyArray:(NSMutableArray *)emptyArray
{
    for (int i = 0; i < 100; i++)
        {
        int randomMember = arc4random() % 4;
        NSString *codon = [_codonArray objectAtIndex:randomMember];
        [emptyArray addObject:codon];
        }
    
    return emptyArray;
}


- (int)hammingDistance:(Cell *)testDNA
{
    int distanceCounter = 0;
    
    for (int i = 0; i < [_dna count]; i++)
    {
        NSString *referenceDNACodon = [_dna objectAtIndex:i];
        NSString *testDNACodon = [[testDNA dna] objectAtIndex:i];

        if (![referenceDNACodon isEqualToString:testDNACodon]) {
            distanceCounter++;
        }        
    }
    
    return distanceCounter;
}

@end

//
//  Cell.m
//  DNA
//
//  Created by Olha Romanko on 06.11.12.
//  Copyright (c) 2012 Olha Romanko. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize arrDNA;
-(id)init
{
    self = [super init];
    [self createArrChainDNA];
    return self;
}
-(void)createArrChainDNA
{
    arrDNA = [[NSMutableArray alloc] init];
    for (int i  = 0; i<=99; i++)
    {
        [arrDNA addObject:[self chooseSimbol]];
    }
}
-(NSString*)chooseSimbol
{
    NSString *simbol = [NSString string];
    int n = arc4random()%4;
    switch (n)
    {
        case 0:
            simbol = @"A";
            break;
        case 1:
            simbol = @"T";
            break;
        case 2:
            simbol = @"G";
            break;
        case 3:
            simbol = @"C";
            break;
            
        default:
            simbol = @"A";
            break;
    }
    return simbol;
}
-(int)hammingDistance:(Cell *)cell
{
    int countNoMach = 0;
    for (NSString * firstEl in self.arrDNA)
    {
        if (![firstEl isEqualToString:[cell.arrDNA objectAtIndex:[self.arrDNA indexOfObject:firstEl]]])
        {
            countNoMach++;
        }
    }
    return countNoMach;
}
@end

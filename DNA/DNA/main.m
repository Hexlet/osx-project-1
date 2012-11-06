//
//  main.m
//  DNA
//
//  Created by Olha Romanko on 06.11.12.
//  Copyright (c) 2012 Olha Romanko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
-(void)mutate:(int)s;
@end

@implementation Cell(Mutator)

-(void)mutate:(int)x
{
    NSMutableArray *arrNumCell = [NSMutableArray array];
    int numCell;
    NSString *newSimbol = [NSString string];
    for(int i = 0; i<x;i++)
    {
        numCell = arc4random()%[arrDNA count];
        if (![arrNumCell containsObject:[NSString stringWithFormat:@"%d",numCell]])
        {
            [arrNumCell addObject:[NSString stringWithFormat:@"%d",numCell]];
        }
    }
    for (int i = 0; i<[arrDNA count]; i++)
    {
        if ([arrNumCell containsObject:[NSString stringWithFormat:@"%d",i]])
        {
            newSimbol = [self chooseSimbol];
            [arrDNA replaceObjectAtIndex:i withObject:newSimbol];
        }
    }
}
@end


int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        Cell *cell = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        int hamming_distance = 0;
        hamming_distance = [cell hammingDistance:cell2];
        NSLog(@"hamming_distance %d",hamming_distance);
        
        [cell mutate:35];
        [cell2 mutate:40];
        hamming_distance = [cell hammingDistance:cell2];
        NSLog(@"hamming_distance after mutate %d",hamming_distance);
    }
    return 0;
}


//
//  main.m
//  DNA
//
//  Created by Daniel Kurapov on 11/2/12.
//  Copyright (c) 2012 Daniel Kurapov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (dnaOperations)

-(void) mutate:(NSInteger)mutate_percent;

@end

@implementation Cell (cellOperations)

-(void) mutate:(NSInteger)mutate_percent
{
    NSInteger mutableCount = 0;
    
    mutableCount = (self.DNA.count / 100) * mutate_percent;
    
    if (mutableCount == 0)
        mutableCount = 1;
    
    NSMutableArray *tempPos = [NSMutableArray arrayWithCapacity:mutableCount];
    
    for (int i = 0; i < mutableCount; ++i)
        [tempPos addObject:[NSNumber numberWithInteger:arc4random() % self.DNA.count]];
    
    NSLog(@"%@",tempPos);
    
    for (int i = 0; i < [tempPos count]; ++i)
    {
        NSInteger curChain = [[tempPos objectAtIndex:i] integerValue];
        NSInteger posIndex = 0;
        
        for (int j = i; j < [tempPos count]; ++j)
        {
            if (j == [tempPos count]-1)
                posIndex = j;
            else
                posIndex = j + 1;
            
            NSInteger curTempChain = [[tempPos objectAtIndex:posIndex] integerValue];
            if (curChain == curTempChain)
                [tempPos replaceObjectAtIndex: posIndex withObject:[NSNumber numberWithInteger: arc4random() % self.DNA.count]];
        }
    }
    
    for (int i = 0; i < tempPos.count; ++i)
    {
        NSInteger posNum = [[tempPos objectAtIndex:i] integerValue];
        [self.DNA replaceObjectAtIndex:posNum withObject:[self.dna_nucliotide objectAtIndex:arc4random()%[self.dna_nucliotide count]]];
    }
    
    NSLog(@"DNA cell after mutate: %@", self.DNA);
}

@end

// Main program

int main(int argc, const char * argv[])
{
    
    @autoreleasepool
    {
        Cell *x_DNA, *y_DNA;
        x_DNA = [[Cell alloc]init];
        y_DNA = [[Cell alloc]init];
        
        [x_DNA hammingDistance:y_DNA];
        [x_DNA mutate:5];
    }
    return 0;
}


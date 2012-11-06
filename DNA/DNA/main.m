//
//  main.m
//  DNA
//
//  Created by User on 06.11.12.
//  Copyright (c) 2012 naoG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell(mutator)
-(void)mutate:(int)c;
@end

@implementation Cell(mutator)
-(void)mutate:(int)c
{
    c = c>100?100:c;
    c = c<0?0:c;
    
    int mutateCount = c/100.0f * DNA_COUNT;
    
    // массив индексов
    NSMutableArray* indexes = [NSMutableArray arrayWithCapacity:DNA_COUNT];
    for (int i = 0; i<DNA_COUNT; i++)
    {
        [indexes addObject:[NSNumber numberWithInteger:i]];
    }
    
    initDnaItems;
    
    // возможные варианты для замены
    NSMutableDictionary* varMatrix = [[NSMutableDictionary alloc]initWithCapacity:[dnaItem count]];
    for (NSString* dnaV in dnaItem)
    {
        NSMutableArray* arr = [NSMutableArray arrayWithArray:dnaItem];
        [arr removeObject:dnaV];
        [varMatrix setObject:arr forKey:dnaV];
    }
    
    // замена
    for (int i=0; i<mutateCount; i++)
    {
        int tmpIndx = arc4random()%[indexes count];
        
        int mutateTargetIndex = [[indexes objectAtIndex:tmpIndx]intValue];
        
        [self.dna replaceObjectAtIndex:mutateTargetIndex
                            withObject:[[varMatrix objectForKey:[self.dna objectAtIndex:mutateTargetIndex]] objectAtIndex:arc4random()%([dnaItem count]-1)] ];

        [indexes removeObjectAtIndex:tmpIndx];
    }
}
@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell* c1 = [[Cell alloc]init];
        Cell* c2 = [[Cell alloc]init];
        NSLog(@"%d",[c1 hammingDistance:c2]);
        [c1 mutate:20];
        [c2 mutate:15];
        NSLog(@"%d",[c1 hammingDistance:c2]);
        
    }
    return 0;
}


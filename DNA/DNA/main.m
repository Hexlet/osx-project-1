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
    
    int mutateCount = c/100.0f * DNA_COUNT;
    
    NSMutableArray* indexes = [NSMutableArray arrayWithCapacity:DNA_COUNT];
    for (int i = 0; i<DNA_COUNT; i++) {
        [indexes addObject:[NSNumber numberWithInteger:i]];
    }
    
    initDnaItems;
    
    for (int i=0; i<mutateCount; i++) {
        int tmpIndx = arc4random()%[indexes count];
        
        [self.dna replaceObjectAtIndex:[[indexes objectAtIndex:tmpIndx]intValue]
                            withObject:[dnaItem objectAtIndex:arc4random()%[dnaItem count]]];
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


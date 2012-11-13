//
//  main.m
//  project 1
//
//  Created by Dmitriy Zhukov on 11/6/12.
//  Copyright (c) 2012 Dmitriy Zhukov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"


int main(int argc, const char * argv[])
{
    sranddev();
    
    @autoreleasepool
    {
        Cell *cell1 = [[[Cell alloc] init] autorelease];
        Cell *cell2 = [[[Cell alloc] init] autorelease];
        
        NSLog(@"Before mutation");
        NSLog(@"Cell #1: %@", cell1);
        NSLog(@"Cell #2: %@", cell2);
        NSLog(@"Hamming distance from #1 to #2: %d", [cell1 hammingDistance:cell2]);
        NSLog(@"Hamming distance from #2 to #1: %d", [cell2 hammingDistance:cell1]);
        
        [cell1 mutate:15];
        [cell2 mutate:25];
        
        NSLog(@"");
        NSLog(@"After mutation");
        NSLog(@"Cell #1: %@", cell1);
        NSLog(@"Cell #2: %@", cell2);
        NSLog(@"Hamming distance from #1 to #2: %d", [cell1 hammingDistance:cell2]);
        NSLog(@"Hamming distance from #2 to #1: %d", [cell2 hammingDistance:cell1]);
    }
    return 0;
}


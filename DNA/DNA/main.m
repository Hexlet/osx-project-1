//
//  main.m
//  DNA
//
//  Created by Tolya on 01.11.12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{
    sranddev();
    
    @autoreleasepool {
        Cell *cell1 = [[[Cell alloc] init] autorelease];
        Cell *cell2 = [[[Cell alloc] init] autorelease];
        
        NSLog(@"Before mutation");
        NSLog(@"Cell 1: %@", cell1);
        NSLog(@"Cell 2: %@", cell2);
        NSLog(@"Hamming distance: %d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:10];
        [cell2 mutate:30];
        
        NSLog(@"");
        NSLog(@"After mutation");
        NSLog(@"Cell 1: %@", cell1);
        NSLog(@"Cell 2: %@", cell2);
        NSLog(@"Hamming distance: %d", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


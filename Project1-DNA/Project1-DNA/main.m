//
//  main.m
//  Project1-DNA
//
//  Created by Administrator on 31.10.12.
//  Copyright (c) 2012 Mykhailo Oleksiuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"BEFORE MUTATION");
        NSLog(@"DNA#1-[%@]", [cell1 toString]);
        NSLog(@"DNA#2-[%@]", [cell2 toString]);
        NSLog(@"Hamming Distance - %d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:[Random randomInteger:100]];
        [cell2 mutate:[Random randomInteger:100]];
        
        NSLog(@"AFTER MUTATION");
        NSLog(@"DNA#1-[%@]", [cell1 toString]);
        NSLog(@"DNA#2-[%@]", [cell2 toString]);
        NSLog(@"Hamming Distance - %d", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


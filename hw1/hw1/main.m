//
//  main.m
//  hw1
//
//  Created by stas on 05.11.12.
//  Copyright (c) 2012. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "CellMutator.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        // % Мутации
        int mutatePercent = 20;
        
        Cell *DNA_1 = [[Cell alloc] init];
        Cell *DNA_2 = [[Cell alloc] init];
        
        NSLog(@"Distance: %d", [DNA_1 hammingDistance:DNA_2]);
        
        NSLog(@"Mutate percent - %d", mutatePercent);
        
        [DNA_1 mutate:mutatePercent];
        [DNA_2 mutate:mutatePercent];
        
        NSLog(@"Distance: %d", [DNA_1 hammingDistance:DNA_2]);
        
    }
    return 0;
}


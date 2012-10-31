//
//  main.m
//  FunnyBiologist
//
//  Created by Paul Dmitryev on 30.10.12.
//  Copyright (c) 2012 Paul Dmitryev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        Cell *cell1, *cell2;
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        NSLog(@"%li", [cell1 hammingDistance: cell2]);
        
        [cell1 mutate:10];
        [cell2 mutate:10];
        NSLog(@"%li", [cell1 hammingDistance: cell2]);
    }
    return 0;
}


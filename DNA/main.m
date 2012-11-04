//
//  main.m
//  DNA
//
//  Created by MacUser on 03.11.12.
//  Copyright (c) 2012 MacUser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc]init];
        Cell *cell2 = [[Cell alloc]init];
        NSLog(@"Distance before mutations: %i.", [cell1 hammingDistance: cell2]);
        
        
        [cell1 mutate: 100];
        [cell1 hammingDistance: cell2];
        NSLog(@"Distance after mutation #1: %i.", [cell1 hammingDistance: cell2]);

        [cell2 mutate: 50];
        NSLog(@"Distance after mutation #2: %i.", [cell1 hammingDistance: cell2]);
        
    }
    return 0;
}

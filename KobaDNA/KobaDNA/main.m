//
//  main.m
//  KobaDNA
//
//  Created by koba on 03.11.12.
//  Copyright (c) 2012 koba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"First distance: %i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:25];
        [cell2 mutate:60];
        
        NSLog(@"Second distance: %i", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


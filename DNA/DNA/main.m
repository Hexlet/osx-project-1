//
//  main.m
//  DNA
//
//  Created by Foboz on 11.11.12.
//  Copyright (c) 2012 Foboz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"%u", [cell1 hammingDistance:cell2]);
        [cell1 mutate:arc4random_uniform(DNA_SIZE)];
        [cell2 mutate:arc4random_uniform(DNA_SIZE)];
        NSLog(@"%u", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


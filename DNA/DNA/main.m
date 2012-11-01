//
//  main.m
//  DNA
//
//  Created by Ivan Glebov on 01.11.12.
//  Copyright (c) 2012 Ivan Glebov. All rights reserved.
//
#import "Cell.h"
#import "Cell+mutator.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *NDA1, *NDA2;
        NDA1 = [[Cell alloc] init];
        NDA2 = [[Cell alloc] init];
        NSLog(@"Hamming distance = %d", [NDA1 hammingDistance: NDA2]);
        [NDA1 mutate:5];
        [NDA2 mutate:10];
        NSLog(@"Hamming distance = %d", [NDA1 hammingDistance: NDA2]);
    }
    return 0;
}


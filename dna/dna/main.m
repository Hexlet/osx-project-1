//
//  main.m
//  dna
//
//  Created by Vitaly Larchenkov on 11/9/12.
//  Copyright (c) 2012 Vitaly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *a = [[Cell alloc] init];
        Cell *b = [[Cell alloc] init];
        NSLog(@"%i", [a hammingDistance:b]);
        [a mutate:50];
        [b mutate:50];
        NSLog(@"%i", [a hammingDistance:b]);
    }
    return 0;
}


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
        Cell *testCell = [[Cell alloc] init];
        Cell *testCell2 = [[Cell alloc] init];
        NSLog(@"Total diffs: %i", [testCell hammingDistance:testCell2]);
    }
    return 0;
}


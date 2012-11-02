//
//  main.m
//  VSHDnaOSXproject
//
//  Created by vshcryabets@gmail.com on 11/1/12.
//  Copyright (c) 2012 vshcryabets@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        Cell *cell1 = [[Cell alloc] init];
        [cell1 print];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"Hamming disctance=%d", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


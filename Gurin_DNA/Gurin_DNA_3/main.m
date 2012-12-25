//
//  main.m
//  Gurin_DNA_3
//
//  Created by Admin on 11/7/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *myCell = [Cell new];
        Cell *myCell_second = [Cell new];
        NSLog(@"hammingDistance: %i",[myCell hammingDistance:myCell_second]);
        [myCell mutate:100];
        [myCell_second mutate:50];
        NSLog(@"hammingDistance: %i",[myCell hammingDistance:myCell_second]);
    }
    return 0;
}


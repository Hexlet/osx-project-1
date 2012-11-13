//
//  main.m
//  DNK
//
//  Created by evgen on 11/9/12.
//  Copyright (c) 2012 evgen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        Cell *myArray1 = [[Cell alloc] init];
        Cell *myArray2 = [[Cell alloc] init];
        NSLog(@"Hamming distance is %i",[myArray1 hammingDistance:myArray2]);
        
        [myArray1 mutate:20];
        [myArray2 mutate:40];
        
        NSLog(@"Hamming distance is %i",[myArray1 hammingDistance:myArray2]);
    }
    return 0;
}


//
//  main.m
//  DNA
//
//  Created by n on 12.11.12.
//  Copyright (c) 2012 n. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Cell *myCell = [[Cell alloc] init];
        Cell *myCell2 = [[Cell alloc] init];
        
        NSLog(@"%d", [myCell hammingDistance:myCell2]);
        
        [myCell mutate:54];
        [myCell mutate:77];
        
        NSLog(@"%d", [myCell hammingDistance:myCell2]);
    }
    return 0;
}


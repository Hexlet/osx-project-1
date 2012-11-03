//
//  main.m
//  DNA
//
//  Created by Andrey Misura on 03.11.12.
//  Copyright (c) 2012 Andrey Misura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Cell *cellSource;
        Cell *cellForCompare;
        
        cellSource = [[Cell alloc] init];
        cellForCompare  = [[Cell alloc] init];
        
        NSLog(@"%i", [cellSource hammingDistance:cellForCompare]);
        
        [cellSource mutate:70];
        [cellForCompare mutate:70];
        
        NSLog(@"%i", [cellSource hammingDistance:cellForCompare]);

    }
    return 0;
}


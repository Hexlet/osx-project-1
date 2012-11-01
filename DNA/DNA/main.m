//
//  main.m
//  DNA
//
//  Created by lexin on 01.11.12.
//  Copyright (c) 2012 lexin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell* cellFirst = [[Cell alloc] init];
        Cell* cellSecond = [[Cell alloc] init];
        
        int difference = [cellFirst hammingDistance:cellSecond];
        NSLog(@"hamming distance before mutate %d",difference);
        [cellFirst release];
        [cellSecond release];
        
    }
    return 0;
}


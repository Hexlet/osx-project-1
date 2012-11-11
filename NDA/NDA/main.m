//
//  main.m
//  NDA
//
//  Created by Tsyganov Stanislav on 12.11.12.
//  Copyright (c) 2012 Tsyganov Stanislav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell* firstCell = [[Cell alloc] init];
        Cell* secondCell = [[Cell alloc] init];
        NSLog(@"\n1:%@\n2:%@", firstCell, secondCell);
        NSLog(@"hamming distnace before mutation:%d", [firstCell hammingDistance:secondCell]);

        [firstCell mutate:50];
        [secondCell mutate:50];
        NSLog(@"hamming distnace after mutation:%d", [firstCell hammingDistance:secondCell]);

        
    }
    return 0;
}


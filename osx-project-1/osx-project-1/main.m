//
//  main.m
//  osx-project-1
//
//  Created by Alexey Kulik on 10/31/12.
//  Copyright (c) 2012 Alexey Kulik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutator.h"

int main (int argc, const char * argv[])
{
    @autoreleasepool {
        
        Cell* cellOne = [[Cell alloc] init];
        Cell* cellTwo = [[Cell alloc] init];
        
        int hammingDistance = [cellOne hammingDistance:cellTwo];
        
        NSLog(@"Hamming distance: %d", hammingDistance);
                
        [cellOne mutate:80];
        [cellTwo mutate:80];
        
        hammingDistance = [cellOne hammingDistance:cellTwo];
        
        NSLog(@"Hamming distance: %d", hammingDistance);
        
    }
    return 0;
}


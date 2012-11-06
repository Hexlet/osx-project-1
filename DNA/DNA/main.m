//
//  main.m
//  DNA
//
//  Created by Mac on 11/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];        
        Cell *cell2 = [[Cell alloc] init];        
        
        int hammingDistance = [cell1 hammingDistance:cell2];
        NSLog(@"Hamming distance between cell1 and cell2 equals %i", hammingDistance);
        
    }
    return 0;
}


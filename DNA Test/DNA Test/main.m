//
//  main.m
//  DNA Test
//
//  Created by Evgeny Golubev on 30.10.12.
//  Copyright (c) 2012 Evgeny Golubev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *DNA1, *DNA2;
        
        DNA1 = [[Cell alloc] init];
        DNA2 = [[Cell alloc] init];
        
        NSLog(@"Hamming Distance: %i",[DNA1 hammingDistance:DNA2]);
        
        [DNA1 mutate:20];
		[DNA2 mutate:40];
        
        NSLog(@"Hamming Distance: %i",[DNA1 hammingDistance:DNA2]);
    }
	
    return 0;
}
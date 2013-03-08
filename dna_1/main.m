//
//  main.m
//  dna_1
//
//  Created by Partisan on 07.03.13.
//  Copyright (c) 2013 partisan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell * myCell1 = [[Cell alloc] init];
        Cell * myCell2 = [[Cell alloc] init];
        
        [myCell1 print];
        [myCell2 print];
        
        NSLog(@"Hamming distance before mutation: %i", [myCell1 hammingDistance:myCell2]);
        
        [myCell1 mutate:10];
        [myCell2 mutate:10];
        
        
        [myCell1 print];
        [myCell2 print];
        
        NSLog(@"Hamming distance after mutation: %i", [myCell1 hammingDistance:myCell2]);
        
    }
    return 0;
}


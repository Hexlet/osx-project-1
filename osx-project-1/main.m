//
//  main.m
//  osx-project-1
//
//  Created by Maxim Zhukov on 05.11.12.
//  Copyright (c) 2012 Maxim Zhukov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *myDNACell1 = [[Cell alloc] initWithMoleculeLength:100];
        Cell *myDNACell2 = [[Cell alloc] initWithMoleculeLength:100];
        
        NSLog(@"First hamming distance = %i",[myDNACell1 hammingDistance:myDNACell2]);
        
        [myDNACell1 mutate:10];
        [myDNACell2 mutate:15];
        
        NSLog(@"Second hamming distance = %i",[myDNACell1 hammingDistance:myDNACell2]);
        
    }
    return 0;
}


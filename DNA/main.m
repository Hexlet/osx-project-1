//
//  main.m
//  DNA
//
//  Created by D_Unknown on 11/6/12.
//  Copyright (c) 2012 D_Unknown. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutate.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
            
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init]; 
        
        NSLog(@"Hamming distance before mutation: %i.\n", [cell1 hammingDistance:cell2]);
        
        NSLog(@"Mutating...\n");
        [cell1 mutate:30];
        [cell2 mutate:70];
                
        NSLog(@"Hamming distance after mutation: %i.\n", [cell1 hammingDistance:cell2]);
    }
    
    return 0;
}


//
//  main.m
//  DNA_HW
//
//  Created by Anatoly Tarnavsky on 11/9/12.
//  Copyright (c) 2012 Anatoly Tarnavsky. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Cell.h"
#import "Cell+DNAMutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc]init];
        Cell *cell2 = [[Cell alloc]init];
        
        NSLog(@"Hamming distance before mutation: %i",[cell1 hammingDistance:cell2]);
        
        [cell1 mutate:30];
        [cell2 mutate:40];
        
        NSLog(@"Hamming distance after mutation: %i",[cell1 hammingDistance:cell2]);

        
        
    }
    return 0;
}


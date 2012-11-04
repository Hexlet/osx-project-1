//
//  main.m
//  dna-project-1
//
//  Created by Apple on 11/3/12.
//  Copyright (c) 2012 Alexander Gedranovich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        if(!cell1 || !cell2){
            return -1;
        }
        
        NSLog(@"Hamming distance = %d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:20];
        [cell2 mutate:80];
        
        NSLog(@"Hamming distance after mutation = %d", [cell1 hammingDistance:cell2]);
        
    }
    
    return 0;
}


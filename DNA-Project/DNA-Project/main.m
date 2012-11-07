//
//  main.m
//  DNA-Project
//
//  Created by Dmitry on 01.11.12.
//  Copyright (c) 2012 Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "MutateCell.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1=[[Cell alloc] init];
        Cell *cell2=[[Cell alloc] init];
        
        NSLog(@"Hamming distance before mutation %d",[cell1 hammingDistance:cell2]);
        
        Cell *cellMutated1=[Cell copyCell:cell1];
        Cell *cellMutated2=[Cell copyCell:cell2];

        [cellMutated1 mutate:75];
        [cellMutated2 mutate:25];
    
        
        NSLog(@"Hamming distance after mutation %d",[cellMutated1 hammingDistance:cellMutated2]);
    }
    return 0;
}


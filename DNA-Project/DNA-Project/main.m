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
        
        //NSLog(@"Arrays 1 %@, 2 %@",[cell1 getDNA],[cell2 getDNA]);
        NSLog(@"Hamming distance beetwen 1 & 2 %d",[cell1 hammingDistance:cell2]);
        
        Cell *cellMutated1=[Cell copyCell:cell1];
        Cell *cellMutated2=[Cell copyCell:cell2];
        //NSLog(@"Arrays 3 %@",[cellMutated getDNA]);
        [cellMutated1 mutate:arc4random()%maxLenght];
        [cellMutated2 mutate:arc4random()%maxLenght];
        
        //NSLog(@"Hamming distance beetwen 1 & 3 after mutation %d",[cell1 hammingDistance:cellMutated1]);
        
        NSLog(@"Hamming distance after mutation 1 & 2 %d",[cellMutated1 hammingDistance:cellMutated2]);
    }
    return 0;
}


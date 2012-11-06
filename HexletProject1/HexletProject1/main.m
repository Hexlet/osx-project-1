//
//  main.m
//  HexletProject1
//
//  Created by F V on 11/1/12.
//  Copyright (c) 2012 F V. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        
        
       // init of 2 Cells
        Cell *newCellOfAnimal1= [[Cell alloc] init];
        [newCellOfAnimal1 print];
        Cell *newCellOfAnimal2= [[Cell alloc] init];
        [newCellOfAnimal2 print];
        
        //Comparison
      NSLog(@"hamming Distance = %i",[newCellOfAnimal1 hammingDistance:newCellOfAnimal2]) ;
        
        //mutation and comparison again
        [newCellOfAnimal1 mutate:40];
        [newCellOfAnimal2 mutate:30];
        [newCellOfAnimal1 print];
        [newCellOfAnimal2 print];
        NSLog(@"hamming Distance = %i",[newCellOfAnimal1 hammingDistance:newCellOfAnimal2]) ;
    
    }
    return 0;
}


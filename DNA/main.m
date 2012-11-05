//
//  main.m
//  DNA
//
//  Created by Alexander on 04.11.12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{
  @autoreleasepool {
      
    Cell *myCell1, *myCell2;
    int distance;
    
    NSLog(@"Cell 1 (original):");
    myCell1 = [[Cell alloc] init];
    [myCell1 printOutDna];

    NSLog(@"Cell 2 (original):");
    myCell2 = [[Cell alloc] init];
    [myCell2 printOutDna];
    
    distance = [myCell1 hammingDistance:myCell2];
    NSLog(@"Hamming distance: %i", distance);
    
    NSLog(@"Mutating Cell 1:");
    [myCell1 mutate:20];
    [myCell1 printOutDna];
    //NSLog(@"%@", [myCell1 lastMutationPointers]);
    

    NSLog(@"Mutating Cell 2:");
    [myCell2 mutate:20];
    [myCell2 printOutDna];
    //NSLog(@"%@", [myCell2 lastMutationPointers]);

    distance = [myCell1 hammingDistance:myCell2];
    NSLog(@"Hamming distance after mutation: %i", distance);
  }
  return 0;
}


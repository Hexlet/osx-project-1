//
//  main.m
//  DNAMutation
//
//  Created by Gosha Arinich on 10/30/12.
//  Copyright (c) 2012 Gosha Arinich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{
  @autoreleasepool {
    Cell *cell1 = [[Cell alloc] init];
    Cell *cell2 = [[Cell alloc] init];
    
    NSLog(@"Pre-mutation hamming distance: %d", [cell1 hammingDistance:cell2]);
    
    [cell1 mutate:50];
    [cell2 mutate:50];
    
    NSLog(@"Post-mutation hamming distance: %d", [cell1 hammingDistance:cell2]);
  }
  
  return 0;
}


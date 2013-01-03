//
//  main.m
//  DNA
//
//  Created by Olexandr Skrypnyk on 03.01.13.
//  Copyright (c) 2013 Olexandr Skrypnyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    Cell *cell, *cell2;

    cell = [[Cell alloc] init];
    cell2 = [[Cell alloc] init];

    NSLog(@"%i", [cell hammingDistance:cell2]);

    [cell mutate:20];
    [cell2 mutate:20];
    
    NSLog(@"%i", [cell hammingDistance:cell2]);
  }

  return 0;
}


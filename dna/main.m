//
//  main.m
//  dna
//
//  Created by Yura Tolstik on 10/31/12.
//  Copyright (c) 2012 Yura Tolstik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutate.h"

int main(int argc, const char * argv[])
{
  @autoreleasepool {
    Cell *cell1 = [[Cell alloc] init];
    Cell *cell2 = [[Cell alloc] init];
    NSLog(@"%d", [cell1 hammingDistance:cell2]);

    [cell1 mutate:10];
    [cell2 mutate:50];
    NSLog(@"%d", [cell1 hammingDistance:cell2]);
  }
  return 0;
}


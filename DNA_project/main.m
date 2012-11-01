//
//  main.m
//  DNA_project
//
//  Created by swante on 10/31/12.
//  Copyright (c) 2012 swante. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{
  @autoreleasepool
  {
    Cell *c1 = [Cell new];
    Cell *c2 = [Cell new];
    
    NSLog(@"Hamming distance between c1 and c2 is %d", [c1 hammingDistance:c2]);
    
    [c1 mutate:25];
    [c2 mutate:50];
    
    NSLog(@"New hamming distance between c1 and c2 is %d", [c1 hammingDistance:c2]);
  }
  
  return 0;
}


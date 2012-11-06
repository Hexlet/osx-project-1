//
//  main.m
//  iDNA
//
//  Created by Darwin on 01.11.12.
//  Copyright (c) 2012 Ivo Dimitrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"%i", [cell1 hammingDistance: cell2]);
        
        //[cell1 mutate:10];
        //[cell2 mutate:25];
        
        NSLog(@"%i", [cell1 hammingDistance: cell2]);
        
    }
    return 0;
}


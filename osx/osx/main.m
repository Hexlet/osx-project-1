//
//  main.m
//  osx
//
//  Created by flom on 10.11.12.
//  Copyright (c) 2012 flom. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Cell.h"
#import "mutator.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        //[cell1 print];
        //[cell2 print];
        NSLog(@"distance=%i", [cell1 hammingDistace:cell2]);
        
        [cell1 mutate:10];
        
        //[cell1 print];
        //[cell2 print];
        NSLog(@"distance=%i", [cell1 hammingDistace:cell2]);
        
        
    }
    return 0;
}
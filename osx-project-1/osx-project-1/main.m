//
//  main.m
//  osx-project-1
//
//  Created by Mac on 09.11.12.
//  Copyright (c) 2012 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        Cell *cell;
        cell = [[Cell alloc] init];
        
        Cell *cell2;
        cell2 = [[Cell alloc] init];
        
        [cell hammingDistance:cell2];
        
    }
    return 0;
}


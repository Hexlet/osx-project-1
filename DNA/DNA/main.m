//
//  main.m
//  DNA
//
//  Created by Straga on 06.11.12.
//  Copyright (c) 2012 Straga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Mutate.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cellFirst = [[Cell alloc] init];
        Cell *cellSecond = [[Cell alloc] init];
        
        NSLog(@"%@",[cellFirst description]);
        NSLog(@"%@",[cellSecond description]);
        NSLog(@"Hello, World!");
        
    }
    return 0;
}


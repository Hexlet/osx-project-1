//
//  main.m
//  02.DNK
//
//  Created by Lert on 10/30/12.
//  Copyright (c) 2012 HEXLET. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        Cell *obj1 = [[Cell alloc]init];
        NSLog(@"obj1 %@", [obj1 description]);
        
        NSArray* dnk_gen = [[NSArray alloc] initWithObjects:@"A",@"T",@"G", @"C", nil ]; //default values
        Cell *obj2 = [[Cell alloc] initWithCapacity:100 andGens:dnk_gen];
        NSLog(@"obj2 %@", [obj2 description]);
        
        NSLog(@" distance = %ld", [obj1 hammingDistance:obj2]);
        
        [obj1 mutate:60];
        [obj2 mutate:40];
        
        NSLog(@" distance = %ld", [obj1 hammingDistance:obj2]);
    }
    return 0;
}


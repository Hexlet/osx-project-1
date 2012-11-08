//
//  main.m
//  HW1-DNA
//
//  Created by Victor Gafiatulin on 05.11.12.
//  Copyright (c) 2012 Victor Gafiatulin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell *myCell1 = [[Cell alloc] init];
        Cell *myCell2 = [[Cell alloc] init];
        NSLog(@"%i", [myCell1 hammingDistance: myCell2]);
        [myCell1 mutate: 30];
        [myCell2 mutate: 10];
        NSLog(@"%i", [myCell1 hammingDistance: myCell2]);
    }
    return 0;
    
}


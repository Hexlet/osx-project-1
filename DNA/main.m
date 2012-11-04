//
//  main.m
//  DNA
//
//  Created by Dmitry Davidov on 04.11.12.
//  Copyright (c) 2012 Dmitry Davidov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        srand([[NSDate date] timeIntervalSince1970]);
        
        Cell *c1 = [[Cell alloc] init];
        Cell *c2 = [[Cell alloc] init];
        
        NSLog(@"%d", [c1 hammingDistance:c2]);
    }
    return 0;
}


//
//  main.m
//  osx-project-1
//
//  Created by qqq qqq on 11/6/12.
//  Copyright (c) 2012 qqq qqq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
- (void) mutate:(int) percent;
@end

@implementation Cell (Mutator)

- (void) mutate:(int) percent {
    for (int i = 0; i < percent; i++) {
        
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        Cell *cell, *cellSubject;
        cell = [[Cell alloc] init];
        cellSubject = [[Cell alloc] init];
        [cell print];
        [cellSubject print];
        
        NSLog(@"hammingDistance: %d", [cell hammingDistance:cellSubject]);
    }
    return 0;
}


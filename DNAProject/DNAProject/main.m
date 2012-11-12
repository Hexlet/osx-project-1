//
//  main.m
//  DNAProject
//
//  Created by Alex Nureev on 11/8/12.
//  Copyright (c) 2012 Alex Nureev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "CellMutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        int mutatePercent = 10;

        Cell *c1 = [[Cell alloc] init];
        Cell *c2 = [[Cell alloc] init];
#ifndef DNA_DEBUG
        NSLog(@"%@", [c1.DNA componentsJoinedByString:@""]);
        NSLog(@"%@", [c2.DNA componentsJoinedByString:@""]);
#endif
	    NSLog(@"humming distance %i", [c1 hummingDistance:c2]);
        NSLog(@"mutate...");

        [c1 mutate:mutatePercent];
        [c2 mutate:mutatePercent];
#ifndef DNA_DEBUG
        NSLog(@"%@", [c1.DNA componentsJoinedByString:@""]);
        NSLog(@"%@", [c2.DNA componentsJoinedByString:@""]);
#endif
        NSLog(@"humming distance %i", [c1 hummingDistance:c2]);
        
    }
    return 0;
}


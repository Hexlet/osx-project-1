//
//  main.m
//  DNA
//
//  Created by Ihor Bodnar on 11/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"



int main (int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1, *cell2;
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        NSLog(@"%d", [cell1 hammingDistance:(cell2)]);
        
        [cell1 mutate:(10)];
        [cell2 mutate:(20)];

        NSLog(@"%d", [cell1 hammingDistance:(cell2)]);
    }

    return 0;
}


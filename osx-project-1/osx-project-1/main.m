//
//  main.m
//  osx-project-1
//
//  Created by Alexander Sviridov on 03.11.12.
//  Copyright (c) 2012 Alexander Sviridov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        [cell1 debugPrint];
        [cell2 debugPrint];
        NSLog(@"First hammingDistance:\t%d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:20];
        [cell2 mutate:10];
        [cell1 debugPrint];
        [cell2 debugPrint];
        NSLog(@"Second hammingDistance:\t%d", [cell1 hammingDistance:cell2]);
        
        [cell1 release];
        [cell2 release];
    }
    return 0;
}


//
//  main.m
//  Lesson2.DNA.II
//
//  Created by Администратор on 11/6/12.
//  Copyright (c) 2012 DS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell* cell1 = [[Cell alloc] init];
        Cell* cell2 = [[Cell alloc] init];
        
        // insert code here...
        NSLog(@"Cell1:%@", [cell1 asString]);
        NSLog(@"Cell2:%@", [cell2 asString]);
        
        int distance = [cell1 hammingDistance:cell2];
        NSLog(@"hDistance = %d", distance);
        NSLog(@"Cell1:%@", [cell1 asString]);
        [cell1 mutate:10];
        [cell2 mutate:20];
        NSLog(@"Cell1:%@", [cell1 asString]);
        NSLog(@"Cell2:%@", [cell2 asString]);
        distance = [cell1 hammingDistance:cell2];
        NSLog(@"hDistance 10%% = %d", distance);
    }
    return 0;
}


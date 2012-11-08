//
//  main.m
//  Project 1
//
//  Created by Администратор on 11/5/12.
//  Copyright (c) 2012 hexlet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        

        Cell* cell1=[[Cell alloc] init];
        Cell* cell2=[[Cell alloc] init];
        NSLog(@"%d",[cell1 hammingDistance:cell2]);
        [cell1 mutate:100];
        [cell2 mutate:100];
        NSLog(@"%d",[cell1 hammingDistance:cell2]);

    }
    return 0;
}


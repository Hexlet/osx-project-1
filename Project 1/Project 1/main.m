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
        NSNumber *n=[NSNumber numberWithInt:[cell1 hammingDistance:cell2]];
        NSLog(@"%@",n);
        [cell1 mutate:100];
        [cell2 mutate:100];
        n=[NSNumber numberWithInt:[cell1 hammingDistance:cell2]];
        NSLog(@"%@",n);
    
    }
    return 0;
}


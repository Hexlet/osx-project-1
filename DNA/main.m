//
//  main.m
//  DNA
//
//  Created by Сергей Греков on 06.11.12.
//  Copyright (c) 2012 Сергей Греков. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        int distance1 = [cell2 hammingDistance:cell1];
        NSLog(@"HAMMING DISTANCE1 %d",distance1);
        NSLog(@"Cell1 before mutate");
        [cell1 print:cell1.DNA];
        NSLog(@"Cell2 before mutate");
        [cell2 print:cell2.DNA];
        
        [cell1 mutate:0];
        [cell2 mutate:80];
        
        NSLog(@"Cell1 after mutate");
        [cell1 print:cell1.DNA];
        
        NSLog(@"Cell2 after mutate");
        [cell2 print:cell2.DNA];
        
        int distance2 = [cell2 hammingDistance:cell1];
        NSLog(@"HAMMING DISTANCE2 %d",distance2);
        
    }
    return 0;
}


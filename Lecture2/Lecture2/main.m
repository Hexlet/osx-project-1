//
//  main.m
//  Lecture2
//
//  Created by Vadim Vatlin on 11/7/12.
//  Copyright (c) 2012 Vadim Vatlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VVCell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        VVCell* cell1 = [[VVCell alloc] init];
        VVCell* cell2 = [[VVCell alloc] init];
        NSLog(@"Hamming distance between cell1 and cell2: %li", [cell1 hammingDistance:cell2]);
    
        NSLog(@"cell1 and cell2 mutating...");
        [cell1 mutate:30];
        [cell2 mutate:10];
        NSLog(@"Hamming distance between cell1 and cell2: %li", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


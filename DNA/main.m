//
//  main.m
//  DNA
//
//  Created by Kirill Morozov on 30.10.12.
//  Copyright (c) 2012 Kirill Morozov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        int distance;
        Cell *myCell1, *myCell2;
        myCell1 = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        
        //myCell1.DNA = @"xxxx";
        //NSLog(@"%@",myCell1);
        //NSLog(@"%@",myCell2);
        distance = [myCell1 hammingDistance:myCell2];
        NSLog(@"hamming distance: %d", distance);
        [myCell1 mutate:70];
        [myCell2 mutate:70];
        distance = [myCell1 hammingDistance:myCell2];
        //NSLog(@"%@",myCell1);
        //NSLog(@"%@",myCell2);
        NSLog(@"hamming distance: %d", distance);
    }
    return 0;
}


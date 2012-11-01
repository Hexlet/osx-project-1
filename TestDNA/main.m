//
//  main.m
//  TestDNA
//
//  Created by Alex Vasilchenko on 01.11.12.
//  Copyright (c) 2012 Alex Vasilchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell ()

-(void)mutatorWithPercentOfDna:(int)m;


@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell = [[Cell alloc]init];
        Cell *cell2 = [[Cell alloc]init];
        NSLog(@"Hamming distance:%d",[cell hammingDistance:cell2]);
        [cell mutatorWithPercentOfDna:9];
        [cell2 mutatorWithPercentOfDna:23];
        NSLog(@"Hamming distance:%d",[cell hammingDistance:cell2]);
    }
    return 0;
}




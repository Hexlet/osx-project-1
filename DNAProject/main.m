//
//  main.m
//  DNAProject
//
//  Created by Andrew on 30.10.12.
//  Copyright (c) 2012 AndrewVanyurin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

//extern NSArray const *ATGC;

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *c1 = [[Cell alloc] init];
        Cell *c2 = [[Cell alloc] init];
        
        NSLog(@"#1 = %i", [c1 hammingDistance:c2]);

        [c1 mutate:10];
        
        NSLog(@"#2 = %i", [c1 hammingDistance:c2]);
    }
    return 0;
}


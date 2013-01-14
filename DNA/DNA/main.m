//
//  main.m
//  arrayRandoom
//
//  Created by vladimir on 14.01.13.
//  Copyright (c) 2013 Владимир Ковалев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+mutate.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell * DNA = [[Cell alloc] init];
        Cell * DNA2 = [[Cell alloc] init];
        
        NSLog(@"\n%@\n%@", DNA, DNA2);        
        NSLog(@"hd = %d", [DNA hammingDistance:DNA2]);
        
        [DNA mutate:100];
        [DNA2 mutate:100];

        NSLog(@"\n%@\n%@", DNA, DNA2);
        NSLog(@"hd = %d", [DNA hammingDistance:DNA2]);
        
    }
    return 0;
}


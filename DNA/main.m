//
//  main.m
//  DNA
//
//  Created by Anton Umnitsyn on 5/11/12.
//  Copyright (c) 2012 Anton Umnitsyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutation.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *DNA1 = [[Cell alloc] init];
        Cell *DNA2 = [[Cell alloc] init];
        
        int distance = [DNA1 hammingDistance:DNA2];
        [DNA1 printDNA];
        [DNA2 printDNA];
        NSLog(@"Current distance: %d", distance);
        
        [DNA1 mutate:100];
        [DNA2 mutate:100];
        distance = [DNA1 hammingDistance:DNA2];
        [DNA1 printDNA];
        [DNA2 printDNA];
        NSLog(@"Current distance: %d", distance);
    }
    return 0;
}


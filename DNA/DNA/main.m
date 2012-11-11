//
//  main.m
//  DNA
//
//  Created by sx on 11.11.12.
//  Copyright (c) 2012 sx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        Cell* cell1 = [[Cell alloc]init];
        Cell* cell2 = [[Cell alloc]init];
        int distance;
        
        distance = [cell1 hammingDistance:(Cell *)cell2];
        NSLog(@"hammingDistance before permutaion: %i", distance);
        
        [cell1 mutate:10];
        [cell2 mutate:10];
        
        distance = [cell1 hammingDistance:(Cell *)cell2];
        NSLog(@"hammingDistance after permutaion: %i", distance);
    }
    
    return 0;
}


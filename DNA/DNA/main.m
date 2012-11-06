//
//  main.m
//  DNA
//
//  Created by Straga on 06.11.12.
//  Copyright (c) 2012 Straga. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cellFirst = [[Cell alloc] init];
        Cell *cellSecond = [[Cell alloc] init];
        
        NSLog(@"%@", cellFirst);
        NSLog(@"%@", cellSecond);
        NSLog(@"Hamming Distance: %d", [cellFirst hammingDistance:cellSecond]);
        
        [cellFirst mutate: 71];
        [cellSecond mutate: 25];
        NSLog(@"\n \n mutation is complit \n \n");
        
        NSLog(@"%@", cellFirst);
        NSLog(@"%@", cellSecond);
        NSLog(@"Hamming Distance: %d", [cellFirst hammingDistance: cellSecond]);
        
    }
    return 0;
}


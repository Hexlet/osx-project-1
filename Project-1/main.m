//
//  main.m
//  Project-1
//
//  Created by Roman Nekhoroshev on 04.11.12.
//  Copyright (c) 2012 Roman Nekhoroshev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *myCell, *myCell2;
        myCell = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
//        [myCell print];
//        [myCell2 print];
        NSLog(@"Hamming distance: %i", [myCell hammingDistance: myCell2]);
        
        [myCell mutate: 30];
        [myCell2 mutate: 10];
//        [myCell print];
//        [myCell2 print];
        NSLog(@"Hamming distance: %i", [myCell hammingDistance: myCell2]);
        
    }
    return 0;
}


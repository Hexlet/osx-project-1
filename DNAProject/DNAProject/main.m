//
//  main.m
//  DNAProject
//
//  Created by Valery Kharshats on 11/3/12.
//  Copyright (c) 2012 Valery Kharshats. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"
#import "NSMutableArray+Shuffling.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // insert code here...
        // NSLog(@"Begin");
        Cell *myCell1 = [[Cell alloc] init];
        // [myCell1 printArray];
        Cell *myCell2 = [[Cell alloc] init];
        //        Cell *myCell2 = [[Cell alloc] init];
//        [myCell2 printArray];
//        Cell *myCell2 = myCell1;
        NSLog (@"Hamming distance before is: %i", [myCell1 hammingDistance: myCell2]);

        [myCell2 mutate: 100];
//        [myCell2 printArray];


        NSLog (@"Hamming distance after is: %i", [myCell1 hammingDistance: myCell2]);
        
    }
    return 0;
}


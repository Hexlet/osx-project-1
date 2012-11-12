//
//  main.m
//  DNA
//
//  Created by Тимофей on 11.11.12.
//  Copyright (c) 2012 Тимофей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{
//A, T, G и С
    @autoreleasepool {
 //       NSArray *array = [[NSArray alloc] initWithObjects:@"one", @"two", @"three", nil];
        
        Cell *myDNA;
        myDNA = [Cell alloc];
        myDNA = [myDNA init];
        
 //      NSLog(@"%@", myDNA);
 //       Cell *my;
        [Cell hammingDistance:myDNA];
//        NSLog(@"%@", myDNA);
 //       NSLog(@"%c", [Cell dnaRandom]);
/*        NSMutableArray *DNA = [[NSMutableArray alloc] init];
        for (int i = 0 ; i < 100; i++) {
            int newElement = [Cell dnaRandom];
            [DNA addObject:[NSString stringWithFormat:@"%c",newElement]];
        }
        NSLog(@"%@", DNA);*/
 //       [marray sortUsingSelector:@selector(compare:)];
 //	       NSLog(@"%@", marray);
        
        [Cell mutate:5];
        
    }
    return 0;
}



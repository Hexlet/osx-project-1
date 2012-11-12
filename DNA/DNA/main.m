//
//  main.m
//  DNA
//
//  Created by Администратор on 11/2/12.
//  Copyright (c) 2012 Nope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"   

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        Cell *myFirstDNA, *mySecondDNA;
        myFirstDNA = [[Cell alloc] init];
        mySecondDNA = [[Cell alloc] init];
        NSLog(@"First DNA:");
        [myFirstDNA show];
        NSLog(@"Second DNA:");
        [mySecondDNA show];
        NSLog(@"Hamming distance is %i", [myFirstDNA hammingDistance:mySecondDNA]);
        [myFirstDNA mutate:77];
        NSLog(@"First DNA after mutation:");
        [myFirstDNA show];
        [mySecondDNA mutate:33];
        NSLog(@"Second DNA after mutation:");
        [mySecondDNA show];
        NSLog(@"New hamming distance is %i", [myFirstDNA hammingDistance:mySecondDNA]);       
    }
    return 0;
}


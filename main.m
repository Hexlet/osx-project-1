//
//  main.m
//  DNA
//
//  Created by Alexander on 30.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"


#define kMutationValue0 50
#define kMutationValue1 33

int main (int argc, const char * argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    Cell *c0 = [Cell cell];
    Cell *c1 = [Cell cell];
    
    NSLog(@"%@", c0);
    NSLog(@"%@", c1);
    NSLog(@"hamming distance: %u", [c0 hammingDistance: c1]);
    
    [c0 mutate: kMutationValue0];
    [c1 mutate: kMutationValue1];
    NSLog(@"cells mutated");
    
    NSLog(@"%@", c0);
    NSLog(@"%@", c1);
    NSLog(@"hamming distance: %u", [c0 hammingDistance: c1]);

    [pool drain];    

    return 0;
}


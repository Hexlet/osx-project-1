//
//  main.m
//  DNA
//
//  Created by Lana on 10/31/12.
//  Copyright (c) 2012 katerinich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell * firstDNA = [[[Cell alloc] init] autorelease];
        Cell * secondDNA = [[[Cell alloc] init] autorelease];
        
        NSLog(@"hammingDistance = %d", [firstDNA hammingDistance:secondDNA]);
        NSLog(@"hammingDistance = %d", [secondDNA hammingDistance:firstDNA]);
        
        int x = arc4random() % 100;
        
        [firstDNA mutate:x];
        
        x = arc4random() % 100;

        [secondDNA mutate:x];
        
        NSLog(@"hammingDistance after matation = %d", [firstDNA hammingDistance:secondDNA]);
        NSLog(@"hammingDistance after matation = %d", [secondDNA hammingDistance:firstDNA]);

        
    }
    return 0;
}


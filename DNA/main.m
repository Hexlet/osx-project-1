//
//  main.m
//  DNA
//
//  Created by Admin on 11/2/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *a, *b;
        
        a = [[Cell alloc] init];
        b = [[Cell alloc] init];
        
        NSLog(@"%@", [a toNSString]);
        NSLog(@"%@", [b toNSString]);
        NSLog(@"%i",[a hammingDistance: b]);
        
        [a mutate: 10];
        [b mutate: 50];
        
        NSLog(@"%@", [a toNSString]);
        NSLog(@"%@", [b toNSString]);
        NSLog(@"%i", [a hammingDistance: b]);
    }
    return 0;
}


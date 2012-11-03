//
//  main.m
//  DNAProject
//
//  Created by sagod on 03.11.12.
//  Copyright (c) 2012 Alexander Gudulin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *c1 = [[Cell alloc] init];
        Cell *c2 = [[Cell alloc] init];
        NSLog(@"Distance is %i", [c1 hammingDistance:c2]);
        
        [c1 mutate:42];
        [c2 mutate:51];
        NSLog(@"Distance is %i", [c1 hammingDistance:c2]);
        
    }
    return 0;
}


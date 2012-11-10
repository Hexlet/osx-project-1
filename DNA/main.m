//
//  main.m
//  DNA
//
//  Created by Dmitry Davidov on 04.11.12.
//  Copyright (c) 2012 Dmitry Davidov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {        
        Cell *c1 = [[Cell alloc] init];
        Cell *c2 = [[Cell alloc] init];
        
        NSLog(@"hamming distance before mutation = %d", [c1 hammingDistance:c2]);
        
        [c1 mutate: 100];
        [c2 mutate: 60];
        
        NSLog(@"hamming distance after mutation = %d", [c1 hammingDistance:c2]);
    }
    
    return 0;
}


//
//  main.m
//  DNA
//
//  Created by Алексей Потемкин on 13.11.12.
//  Copyright (c) 2012 Алексей Потемкин. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *oneCell = [[Cell alloc] init];
        Cell *anotherCell = [[Cell alloc] init];
        
        NSLog(@"Hamming distance before mutation = %d", [oneCell hammingDistance:anotherCell]);
        
        [oneCell mutate:10];
        [anotherCell mutate:30];
        
        NSLog(@"Hamming distance after mutation = %d", [oneCell hammingDistance:anotherCell]);
        
    }
    return 0;
}


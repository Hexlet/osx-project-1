//
//  main.m
//  DNA
//
//  Created by Alexander Madyankin on 02.11.12.
//  Copyright (c) 2012 Alexander Madyankin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *firstCell  = [[Cell alloc] init];
        Cell *secondCell = [[Cell alloc] init];
        
        NSLog(@"%i", [firstCell hammingDistance: secondCell]);
        
        [firstCell mutate: 70];
        [secondCell mutate: 70];
        NSLog(@"%i", [firstCell hammingDistance: secondCell]);
        
    }
    return 0;
}


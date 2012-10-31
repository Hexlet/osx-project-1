//
//  main.m
//  osx-1
//
//  Created by Александр Турченко on 30.10.12.
//  Copyright (c) 2012 TurchenkoAlex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Core/Cell.h"
#import "Extends/Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *firstCell = [[Cell alloc] init];
        //NSLog(@"Cell 1: %@", firstCell);
        
        Cell *secondCell = [[Cell alloc] init];
        //NSLog(@"Cell 2: %@", secondCell);
        
        NSLog(@"Haming distance: %d", [firstCell hammingDistance:secondCell]);
        
        [firstCell mutateDNAWithPercentage:20];
        [secondCell mutateDNAWithPercentage:10];
        
        NSLog(@"Haming distance after mutation: %d", [firstCell hammingDistance:secondCell]);
        
    }
    return 0;
}


//
//  main.m
//  osx-1
//
//  Created by Александр Турченко on 30.10.12.
//  Copyright (c) 2012 TurchenkoAlex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Extends/Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *firstCell = [[Cell alloc] init];
        Cell *secondCell = [[Cell alloc] init];

        NSLog(@"Haming distance: %d", [firstCell hammingDistance:secondCell]);
        
        [firstCell mutateDNAWithPercentage:50];
        [secondCell mutateDNAWithPercentage:30];

        NSLog(@"Haming distance after mutation: %d", [firstCell hammingDistance:secondCell]);

    }
    return 0;
}


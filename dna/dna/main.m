//
//  main.m
//  dna
//
//  Created by Evgeny Trefilov on 11/4/12.
//  Copyright (c) 2012 Evgeny Trefilov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell* firstCell = [[Cell alloc] initWithGenes:100];
        Cell* secondCell = [[Cell alloc] initWithGenes:100];
        
        NSLog(@"Distance is %i",[firstCell hammingDistance:secondCell]);
        
        [firstCell mutate:25];
        [secondCell mutate:60];
        
        NSLog(@"Distance after mutation is %i",[firstCell hammingDistance:secondCell]);
        
         }
    return 0;
}


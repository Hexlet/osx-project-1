//
//  main.m
//  DNA
//
//  Created by Pavel Krishtalskiy on 03.11.12.
//  Copyright (c) 2012 Pavel Krishtalskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell* cell1 = [[Cell alloc] init];
        Cell* cell2 = [[Cell alloc] init];
        int i;
        
//        [cell1 printDNA];
//        [cell2 printDNA];
        
        i = [cell1 hammingDistance:cell2];
        NSLog(@"Hamming distance before mutation is %i.", i);
        
        [cell1 mutate:60];
        [cell2 mutate:76];
        
//        [cell1 printDNA];
//        [cell2 printDNA];
        
        i = [cell1 hammingDistance:cell2];
        NSLog(@"Hamming distance after mutation is %i.", i);
        
    }
    return 0;
}


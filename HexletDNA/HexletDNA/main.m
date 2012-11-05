//
//  main.m
//  HexletDNA
//
//  Created by Aleksandr Shepeliev on 04.11.12.
//  Copyright (c) 2012 Aleksandr Shepeliev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"Hamming distance: %d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:57];
        [cell2 mutate:84];
        
        NSLog(@"Hamming distance after mutation: %d", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}


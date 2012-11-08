//
//  main.m
//  DNA
//
//  Created by phantom on 08.11.12.
//
//

#import <Foundation/Foundation.h>
#import <stdlib.h>

#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{
    srandomdev();

    @autoreleasepool {
        
        Cell * cell1 = [[Cell alloc] init];
        Cell * cell2 = [[Cell alloc] init];
        
        NSLog(@"cell1: %@", [cell1 toString]);
        NSLog(@"cell2: %@", [cell2 toString]);
        
        NSLog(@"distance: %ld", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:70];
        
        NSLog(@"cell1 after mutation: %@", [cell1 toString]);
        
        NSLog(@"distance after mutation: %ld", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


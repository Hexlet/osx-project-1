//
//  main.m
//  DNK
//
//  Created by p.naumov on 01.11.12.
//  Copyright (c) 2012 p.naumov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Mutator.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"Cell 1 %@", cell1);
        NSLog(@"Cell 2 %@", cell2);
        NSLog(@"Haming Distance: %d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:10];
        [cell2 mutate:25];
        
        NSLog(@"Mutated Cell 1 %@", cell1);
        NSLog(@"Mutated Cell 2 %@", cell2);
        NSLog(@"Haming Distance: %d", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}


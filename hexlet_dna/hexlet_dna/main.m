//
//  main.m
//  hexlet_dna
//
//  Created by Alexander Shvets on 02.11.12.
//  Copyright (c) 2012 Alexander Shvets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"DNA1: %@",[cell1.dna componentsJoinedByString:@""]);
        NSLog(@"DNA2: %@",[cell2.dna componentsJoinedByString:@""]);
        
        NSLog(@"\rHamming Distance: %d", [cell1 hammingDistance:cell2]);
        
        
        //после мутации
        NSLog(@"Mutating....");
        
        [cell1 mutate:55];
        [cell1 mutate:38];
        
        NSLog(@"DNA1: %@",[cell1.dna componentsJoinedByString:@""]);
        NSLog(@"DNA2: %@",[cell2.dna componentsJoinedByString:@""]);
        
        NSLog(@"\rHamming Distance: %d", [cell1 hammingDistance:cell2]);
                
    }
    return 0;
}


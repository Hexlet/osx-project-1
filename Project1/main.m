//
//  main.m
//  Project1
//
//  Created by Sergey Atroschenko on 31.10.12.
//  Copyright (c) 2012 ASVUSER. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[]) {

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        NSLog( @"Cell1: %@", cell1 );
        
        Cell *cell2 = [[Cell alloc] init];
        NSLog( @"Cell2: %@", cell2 );
        
        NSLog( @"Hamming distance before mutate: %ld", [cell1 hammingDistance: cell2] );
        
        // Mutate.
        NSLog( @"Mutate..." );
        [cell1 mutate: arc4random() % 100];
        [cell2 mutate: arc4random() % 100];
        
        NSLog( @"Cell1: %@", cell1 );
        NSLog( @"Cell2: %@", cell2 );
        
        
        NSLog( @"Hamming distance after mutate: %ld", [cell1 hammingDistance: cell2] );
    }
    return 0;
}


//
//  main.m
//  DNA
//
//  Created by Mihail Onoprienko on 3.11.12.
//  Copyright (c) 2012 Mihail Onoprienko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        @try {
            Cell *cell1 = [[Cell alloc] init];
            Cell *cell2 = [[Cell alloc] init];
        
            NSLog(@"First cell DNA: %@", cell1);
            NSLog(@"Second cell DNA: %@", cell2);
        
            NSLog(@"Hamming distance between cells: %i", [cell1 hammingDistance: cell2] );
        
            NSLog(@"Mutating...");
        
            [cell1 mutate: 5];
            [cell2 mutate: 100];
            
            NSLog(@"First cell DNA: %@", cell1);
            NSLog(@"Second cell DNA: %@", cell2);
        
            NSLog(@"After mutation, hamming distance is: %i", [cell1 hammingDistance: cell2]);
        }
        @catch (NSException *exception) {
            NSLog(@"main: Caught %@: %@", [exception name], [exception reason]);
        }
    }
    return 0;
}


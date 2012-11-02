//
//  main.m
//  HexletProject1DNA
//
//  Created by Sviatoslav on 02.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Muttator.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Cell * firstCell = [[Cell alloc] init];
        Cell * secondCell = [[Cell alloc] init];       
        
        NSLog(@"first cell  [%@]", firstCell);
        NSLog(@"second cell [%@]", secondCell);
        NSLog(@"hamming distance: %ld", [firstCell hammingDistance:secondCell]);
        
        NSLog(@"--= MUTATE =--");
        [firstCell mutate:15];
        [secondCell mutate:75];
       
        NSLog(@"first cell  [%@]", firstCell);
        NSLog(@"second cell [%@]", secondCell);
        
        NSLog(@"hamming distance after mutate: %ld", [firstCell hammingDistance:secondCell]);
                
    }
    return 0;
}


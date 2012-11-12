//
//  main.m
//  prj1-DNA
//
//  Created by void on 12.11.12.
//  Copyright (c) 2012 void. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell_Mutator.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        Cell *cell1, *cell2;
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        NSLog(@"Now HD is %i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:44];
        [cell2 mutate:88];
        
        NSLog(@"And HD after mutate is %i", [cell1 hammingDistance:cell2]);
    }
    
    return 0;
}




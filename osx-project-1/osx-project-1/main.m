//
//  main.m
//  osx-project-1
//
//  Created by Andrew Kolisnichenko on 11/4/12.
//  Copyright (c) 2012 Andrew Kolisnichenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Cell* cell1 = [[Cell alloc]init];
        Cell* cell2 = [[Cell alloc]init];
        [cell1 print];
        [cell2 print];
        NSLog(@"Number of different nucleotides is %i", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:50];
        [cell2 mutate:50];
        [cell1 print];
        [cell2 print];
        NSLog(@"Number of different nucleotides after mutation is %i", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


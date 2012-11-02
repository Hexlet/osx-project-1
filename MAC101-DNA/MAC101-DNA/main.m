//
//  main.m
//  MAC101-DNA
//
//  Created by Nikita Korchagin on 31.10.12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKCell.h"
#import "NKCell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NKCell *cell1 = [[[NKCell alloc] init] autorelease];
        NKCell *cell2 = [[[NKCell alloc] init] autorelease];
        
        NSLog(@"Hamming distance between two cells: %ld", [cell1 hammingDistance:cell2]);
        
        [cell1 mutatePercentOfSymbols:40];
        [cell2 mutatePercentOfSymbols:20];

        NSLog(@"Hamming distance between two cells after mutation: %ld", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


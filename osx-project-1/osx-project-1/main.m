//
//  main.m
//  osx-project-1
//
//  Created by HexletStudent13 on 10/31/12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        int hd1 = [cell1 hammingDistance:cell2];
        
        [cell1 mutate:76];
        [cell2 mutate:27];
        
        int hd2 = [cell1 hammingDistance:cell2];
        
        NSLog(@"\nHamming distance before mutation: %i\nHamming distance after mutation: %i", hd1, hd2);
    }
    return 0;
}


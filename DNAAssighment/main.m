//
//  main.m
//  DNAAssighment
//
//  Created by Oleg Langer on 30.10.12.
//  Copyright (c) 2012 Oleg Langer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        int hamingDistance = [cell1 hammingDistance:cell2];
        
        NSLog(@"Hamming Distance before mutation: \n%d", hamingDistance);
        
        [cell1 mutate:30];
        [cell2 mutate:30];
        hamingDistance = [cell1 hammingDistance:cell2];

        NSLog(@"Hamming Distance after mutation: \n%d", hamingDistance);

    }
    return 0;
}


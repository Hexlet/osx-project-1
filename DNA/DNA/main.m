//
//  main.m
//  DNA
//
//  Created by Kirill Ragozin on 10 / 31 / 12.
//  Copyright (c) 2012 Kirill Ragozin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"%i", [Cell hammingDistanceBetween:cell1 and:cell2]);
        [cell1 mutate:17];
        [cell2 mutate:42];
        NSLog(@"%i", [Cell hammingDistanceBetween:cell1 and:cell2]);
    }
    return 0;
}


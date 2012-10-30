//
//  main.m
//  FunnyBiologist
//
//  Created by Paul Dmitryev on 30.10.12.
//  Copyright (c) 2012 Paul Dmitryev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell(Mutator)
    -(void)mutate: (int) percent;
@end

@implementation Cell(Mutator)
    -(void)mutate: (int) percent {
        NSCAssert((percent>0) && (percent<100), @"Invalid percentage!");
        NSUInteger randKey;
        for(int i=0; i<percent; i++) {
            randKey = arc4random() % [self.DNA count];
            self.DNA[randKey] = [Cell getRandomDNA];
        }
    }
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1, *cell2;
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];

        NSLog(@"%i", [cell1 hammingDistance: cell2]);

        [cell1 mutate:90];
        [cell2 mutate:80];
        NSLog(@"%i", [cell1 hammingDistance: cell2]);
    }
    return 0;
}


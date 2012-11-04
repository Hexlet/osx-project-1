//
//  main.m
//  dna-project
//
//  Created by Илья Бельский on 11/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell* cellOne = [[Cell alloc] init];
        Cell* cellTwo = [[Cell alloc] init];
      
        //NSLog(@"cell one: %@", [cellOne getDnaAsString]);
        //NSLog(@"cell two: %@", [cellTwo getDnaAsString]);
        
        int distance_before = [cellOne hammingDistance:cellTwo];
        [cellOne mutate:11];
        [cellTwo mutate:11];
        int distance_after = [cellOne hammingDistance:cellTwo];
        
        NSLog(@"distance before mutation: %d", distance_before);       
        NSLog(@"distance after  mutation: %d", distance_after);
    }
    return 0;
}


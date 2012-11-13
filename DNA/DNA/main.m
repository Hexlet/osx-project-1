//
//  main.m
//  DNA
//
//  Created by Alex on 11/9/12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        int distance1 = [cell1 hammingDistance:cell2];
        
        NSLog(@"%i", distance1);
        
        [cell1 mutate:5];
        [cell2 mutate:5];
        
        int distance2 = [cell1 hammingDistance:cell2];
        
        NSLog(@"%i", distance2);
    }
    return 0;
}


//
//  main.m
//  DNA
//
//  Created by Aliaksandr Minets on 10/31/12.
//  Copyright (c) 2012 minchik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell+Mutator.h"







int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        
        Cell *firstCell = [[Cell alloc] init];
        Cell *secondCell = [[Cell alloc] init];
        
        //NSLog(@"%@", [firstCell getDna]);
        //NSLog(@"%@", [secondCell getDna]);
        
        NSLog(@"%i",[firstCell hammingDistance:secondCell]);
        
        [firstCell mutate:50];
        [secondCell mutate:50];
        
        NSLog(@"%i", [firstCell hammingDistance:secondCell]);
        
        //NSLog(@"%@", [firstCell getDna]);
        //NSLog(@"%lu", [[firstCell getDna] count]);

        
    }
    return 0;
}


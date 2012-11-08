//
//  main.m
//  DNA
//
//  Created by Екатерина Полищук on 06.11.12.
//
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"


int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        Cell *oneCell = [[Cell alloc] init];
        Cell *twoCell = [[Cell alloc] init];
        
        NSLog(@"Number of different symbol between oneCell and twoCell is %i",
              [oneCell hammingDistance:twoCell]);
        
        [oneCell mutate:43];
        [twoCell mutate:71];
        
        NSLog(@"Number of different symbol between oneCell and twoCell is %i",
              [oneCell hammingDistance:twoCell]);
        
    }
    return 0;
}

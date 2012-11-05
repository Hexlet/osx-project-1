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
        
        int numberOfDifferentSymbols= [oneCell hammingDistance:twoCell];
        NSLog(@"Number of different symbol between oneCell and twoCell is %i", numberOfDifferentSymbols);
        
        [oneCell mutate:43];
        [twoCell mutate:71];
        
        numberOfDifferentSymbols = [oneCell hammingDistance:twoCell];
        NSLog(@"Number of different symbol between oneCell and twoCell is %i", numberOfDifferentSymbols);
        
    }
    return 0;
}

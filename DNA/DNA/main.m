//
//  main.m
//  DNA

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *firstCell = [[Cell alloc]init];
		Cell *secondCell = [[Cell alloc]init];
        NSLog(@"Humming distance is %i ", [firstCell hammingDistance:secondCell]);
		
		[firstCell mutate:10];
		[secondCell mutate:30];
		
        NSLog(@"New humming distance is %i ", [firstCell hammingDistance:secondCell]);        
    }
    return 0;
}


//
//  main.m
//  helloworld
//
//  Created by Volodia on 29.10.12.
//  Copyright (c) 2012 LID Sowtware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)

-(void) mutate: (int) mutations;

@end

@implementation Cell (Mutator)

-(void) mutate: (int) mutations {
    for (int i = 0; i < mutations; i++) {
        [self setNucleo:[[Nucleotide alloc] initWithName:@"A"] atIndex:i];
    }
}

@end

void printDistance(Cell *oneCell, Cell *secondCell) {
    NSLog(@"First cell = %@", [oneCell description]);
    NSLog(@"Second cell = %@", [secondCell description]);
    NSLog(@"Distance = %i", [oneCell hammingDistance:secondCell]);
}

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        Cell * oneCell = [[Cell alloc] init];
        Cell * secondCell = [[Cell alloc] init];
        printDistance(oneCell, secondCell);
        
        [oneCell mutate:50];
        [secondCell mutate:50];
        printDistance(oneCell, secondCell);
    }
    return 0;
}


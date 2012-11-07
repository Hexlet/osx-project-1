//
//  main.m
//  Learn-osx-project-1
//
//  Created by Mikhail Dudek on 07.11.12.
//  Copyright (c) 2012 Mikhail Dudek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell(mutator)

-(void)mutate:(int)x;

@end

@implementation Cell(mutator)

-(void)mutate:(int)percents{
    if (percents>100) {
        percents=100;
    } else if (percents<0) {
        percents=0;
    }
    int countLetters = kLengthOfDNA * percents / 100;
    NSMutableSet *changedLetters = [NSMutableSet set];
    NSNumber *randomIndex;
    while (changedLetters.count<countLetters) {
        randomIndex = [[NSNumber alloc] initWithInt: arc4random_uniform(kLengthOfDNA-1)];
        if (![changedLetters containsObject:randomIndex]) {
            [changedLetters addObject:randomIndex];
            [self.DNA setObject:[kLetters objectAtIndex:arc4random_uniform(kLettersCount)] atIndexedSubscript:[randomIndex integerValue]];
        }
    }
    NSLog(@"Cell mutated. DNA: %@",[self.DNA componentsJoinedByString:@""]);
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *firstCell = [[Cell alloc] init];
        Cell *secondCell = [[Cell alloc] init];
        NSLog(@"Cells distance: %i",[firstCell hammingDistance:secondCell]);
        
        [firstCell mutate:50];
        [secondCell mutate:20];
        NSLog(@"Cells distance: %i",[firstCell hammingDistance:secondCell]);
    }
    return 0;
}


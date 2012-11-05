//
//  main.m
//  osx-project-1
//
//  Created by Mikhail on 02.11.12.
//  Copyright (c) 2012 Mikhail. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Cell.h"


@interface Cell (mutator)

-(void) mutate:(int) X;

@end

@implementation Cell (mutator)

-(void) mutate:(int) X
{
    // Check
    if (X <= 0 || X > [self.DNA count])
        return;

    int mutationCount = 0;
    unsigned long c = [self.DNA count];\
    
    
    bool *mutated = malloc(sizeof(bool)*c);
    for (int i=0; i < c ; ++i)
        mutated[i] = false;
    
    // Do mutation
    while (mutationCount < X) {
        // Find unmutated position
        int pos = arc4random() % c;
        while (mutated[pos])
            pos = arc4random() % c;
        
        // Get pointer to position for mutate
        MyChar * current = [self.DNA objectAtIndex:pos];
        
        // Find new value
        char newValue = [Cell randNucleotide];
        while ([current value] == newValue)
            newValue = [Cell randNucleotide];
        
        // Change to new value
        [current setValue:newValue];
        
        // Mark position as mutated
        mutated[pos] = true;
        
        // Increase counter
        ++mutationCount;
    }
    
    free(mutated);

}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog(@"hammingDistance is %i", [cell hammingDistance:cell2]);
        
        int X = 10;
        [cell mutate:X];
        [cell2 mutate:X];
        
        NSLog(@"hammingDistance after %i%% mutation is %i", X, [cell hammingDistance:cell2]);

        
    }
    return 0;
}


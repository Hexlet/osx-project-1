//
//  main.m
//  myDna
//
//  Created by Sergii on 10/31/12.
//  Copyright (c) 2012 Sergii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

// mutator category
@interface Cell (mutator)
-(void) mutate:(int)percent;
@end

@implementation Cell (mutator)
-(void) mutate:(int)percent {
   
    NSMutableArray *uniqNumbers = [[NSMutableArray alloc] init];
    
    // Calculate items count according to percent
    while ([uniqNumbers count] < (int)round([DNA count] * percent / 100)) {
        
        // Get random element index/number from [DNA count]
        int r = arc4random() % [DNA count];
        
        // Check if generated index not exists in uniqNumbers array
        if (![uniqNumbers containsObject:[NSNumber numberWithInteger:r]]) {
        
            // Populate uniqNumbers array with new unique element
            [uniqNumbers addObject: [NSNumber numberWithInteger:r]];
            
            // Randomize choosen DNA element
            [DNA setObject:[self getRandom] atIndexedSubscript:r];
        }
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Declare new Cell class instance
        Cell *myCell1 = [[Cell alloc] initWithCapacity:243];
        Cell *myCell2 = [[Cell alloc] initWithCapacity:243];
        
        // Count and print harmming distance
        NSLog(@"Normal hammingDistance: %i", [myCell1 hammingDistance:[myCell2 getDNA]]);
        
        // Mutate cells
        [myCell1 mutate:30];
        [myCell2 mutate:30];
        
        // Count and print harmming distance
        NSLog(@"Mutated hammingDistance: %i", [myCell1 hammingDistance:[myCell2 getDNA]]);
        
    }
    return 0;
}


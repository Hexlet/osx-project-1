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
   
    // Check for correct percent value
    if (0 < percent > 100) {
        [NSException raise:@"Invalid percent value" format:@"percent: %i is invalid", percent];
    }
    
    NSMutableArray *uniqNumbers = [[NSMutableArray alloc] init];
    NSString *randomElement = [NSString string];
    
    // Calculate items count according to percent
    while ([uniqNumbers count] <= (int)round([self.DNA count] * percent / 100)) {
        
        // Get random element index/number from [DNA count]
        int r = arc4random() % [self.DNA count];
        
        // Check if generated index not exists in uniqNumbers array
        if (![uniqNumbers containsObject:[NSNumber numberWithInteger:r]]) {
        
            // Populate uniqNumbers array with new unique element
            [uniqNumbers addObject: [NSNumber numberWithInteger:r]];
           
            // Randomize DNA element != previous  value
            do {
                randomElement = [self getRandom];
            } while ([self.DNA objectAtIndex:r] == randomElement);
            
            // Replace with new random value
            [self.DNA replaceObjectAtIndex:r withObject:randomElement];
            
        }
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Declare new Cell class instance
        Cell *myCell1 = [[Cell alloc] init];
        Cell *myCell2 = [[Cell alloc] init];
        
        // Count and print harmming distance
        NSLog(@"Normal  hammingDistance: %i", [myCell1 hammingDistance:myCell2.DNA]);
        
        // Mutate cells
        [myCell1 mutate:45];
        [myCell2 mutate:65];
        
        // Count and print harmming distance
        NSLog(@"Mutated hammingDistance: %i", [myCell1 hammingDistance:myCell2.DNA]);
        
    }
    return 0;
}


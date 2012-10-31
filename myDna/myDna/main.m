//
//  main.m
//  myDna
//
//  Created by Sergii on 10/31/12.
//  Copyright (c) 2012 Sergii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void) mutate:(int)percent;
@end

@implementation Cell (mutator)
-(void) mutate:(int)percent {
   
    NSMutableArray *uniqNumbers = [[NSMutableArray alloc] init];
    
    // Calculate items count according to percents
    while ([uniqNumbers count] < (int)round([DNA count] * percent / 100)) {
        int r = arc4random() % [DNA count];
        if (![uniqNumbers containsObject:[NSNumber numberWithInteger:r]]) {
            // Populate array of unique elements
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
        
        Cell *myCell1 = [[Cell alloc] initWithCapacity:243];
        Cell *myCell2 = [[Cell alloc] initWithCapacity:243];
        
        NSLog(@"Normal hammingDistance: %i", [myCell1 hammingDistance:[myCell2 getDNA]]);
        
        [myCell1 mutate:30];
        [myCell2 mutate:30];
        
        NSLog(@"Mutated hammingDistance: %i", [myCell1 hammingDistance:[myCell2 getDNA]]);
        
    }
    return 0;
}


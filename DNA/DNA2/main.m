//
//  main.m
//  DNA2
//
//  Created by Alexey Fedotov on 04.11.12.
//  Copyright (c) 2012 Alexey Fedotov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (mutator)

- (void)mutate: (int) value;

@end

@implementation Cell (mutator)

- (void)mutate: (int) percent{
    
    //Create empty array of mutated gens positions
    NSMutableArray *mutatedGensPositions = [[NSMutableArray alloc] initWithCapacity:percent];
    
    //Mutate each of gens
    for (int i = 0; i < percent; ++i) {
        
        int genPosition = 0;
        do {
            //Get random position of gen
            genPosition = arc4random() % 100;
            
        //Do it, while position is not unique (while gen is already mutated)
        } while ([mutatedGensPositions containsObject:[NSNumber numberWithInt:genPosition]]);
        
        //Ok, we have position of unmutated gen
        
        //Get unmutated gen value
        NSString *gen = [[self DNA] objectAtIndex:genPosition];
        
        ///Get a new unique value for gen
        
        NSString *mutatedGen = nil;
        do {
            //Get random value of gen from static array
            mutatedGen = [[self source] objectAtIndex:arc4random() % 4];
            
        //Do it, while value is not change
        } while ([mutatedGen isEqualToString:gen]);

        //Mutate gen!
        [[self DNA] replaceObjectAtIndex:genPosition withObject:mutatedGen];
        
        //Add position of mutated gen to array
        [mutatedGensPositions addObject:[NSNumber numberWithInt:genPosition]];
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cellOne = [[Cell alloc] init];
        Cell *cellTwo = [[Cell alloc] init];
        NSLog(@"First hammingDistance = %d", [cellOne hammingDistance:cellTwo]);
        [cellOne mutate:10];
        [cellTwo mutate:20];
        NSLog(@"Second hammingDistance = %d", [cellOne hammingDistance:cellTwo]);
        
    }
    return 0;
}


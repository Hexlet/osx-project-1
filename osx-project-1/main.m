//
//  main.m
//  osx-project-1
//
//  Created by m g on 11/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell (mutator)
-(void)mutate:(int)percent;
@end

@implementation Cell (mutator)

-(void)mutate:(int)percent
{
    int forMutate =  (int)([DNA count] * percent / 100);

    NSMutableArray* indexForMutate = [NSMutableArray arrayWithCapacity:forMutate];
    for (int i = 0; i < forMutate; i++)
    {
        NSNumber* wrapInt;
        do
        {
            int index = rand()%forMutate;
            wrapInt = [NSNumber numberWithInt:index];        
        }
        while ( [indexForMutate containsObject:wrapInt]);
        [indexForMutate addObject:wrapInt];
    }
    
    for (int i = 0 ; i < [indexForMutate count]; i++)
    {
        NSNumber *letter = [DNA objectAtIndex:[[indexForMutate objectAtIndex:i] intValue]];
        int new_letter;
        
        do
        {
            new_letter = rand()%letterLast;
        }
        while (new_letter == [letter intValue]);
        
        letter = [NSNumber numberWithInt:new_letter];
        [DNA replaceObjectAtIndex:[[indexForMutate objectAtIndex:i] intValue] withObject:letter];
    }
}

@end

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *firstCell, *seconCell;
        firstCell = [[Cell alloc ] init];
        seconCell = [[Cell alloc] init];
        
        [firstCell print];
        [seconCell print];
        int distanse = [firstCell hummingDistance:seconCell];
        NSLog(@"humming distanse = %i", distanse);
        [firstCell mutate:50];
        [seconCell mutate:10];
        [firstCell print];
        [seconCell print];
        distanse = [firstCell hummingDistance:seconCell];
        NSLog(@"humming distanse after mutation = %i", distanse);
        
        // mutate
    }
    return 0;
}


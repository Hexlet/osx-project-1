//
//  Cell+mutator.m
//  osx-project-1
//
//  Created by mac mini on 04.11.12.
//  Copyright (c) 2012 hexlet. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
@dynamic DNA;
- (void) mutate:(int)percent
{
    //get the count of elements of DNA array, which we want to change
    int countOfChangeElements = (int) roundf(DNA_SIZE/100.0*percent);
    //create the array, where we store of number of elements, which we changes
    NSMutableArray* changeNumbers = [[NSMutableArray alloc] initWithCapacity:countOfChangeElements];
    if(countOfChangeElements!=0)
    {
        

        
        while (countOfChangeElements>0)
        {
            bool contains = false;
            int number = 0;
            do
            {
                number = arc4random_uniform(DNA_SIZE);
                for(int i=0;i<[changeNumbers count];i++)
                    if([[changeNumbers objectAtIndex:i] intValue]==number)
                    {
                        contains = true;
                        break;
                    }
                    else contains = false;
            } while (contains);
            NSString* newValue = [[NSString alloc] init];
            do
            {
                newValue = [self getNewGenom];


            } while ([[[self DNA] objectAtIndex:number] isEqualToString:newValue]);
            [[self DNA] replaceObjectAtIndex:number withObject:newValue];
            NSNumber* objectNumber = [NSNumber numberWithInt:number];
            [changeNumbers addObject:objectNumber];
            countOfChangeElements--;
        }
    }
}
@end

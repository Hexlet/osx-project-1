//
//  Cell+MutateCell.m
//  osx-project-1
//
//  Created by Alex Pulichkin on 06.11.12.
//  Copyright (c) 2012 Alex Pulichkin. All rights reserved.
//

#import "Cell+MutateCell.h"

@implementation Cell (MutateCell)

-(void)mutate:(int)x
{
    @try {
        if (x > 100 || x <= 0) {
            [NSException raise:@"Invalid value" format:@"You percent value is invalid. Please enter current value, from '1' to '100'"];
        }
        
        NSMutableArray *indexes = [[NSMutableArray alloc]init];
        NSNumber * randomIndex =[[NSNumber alloc] initWithInteger:arc4random() % x];
        [indexes addObject:randomIndex];
        
        for (NSUInteger i=0; i<x; i++)
        {
            for (int j=0; j<[indexes count]; j++) {
            randomIndex =[[NSNumber alloc] initWithInteger:arc4random() % x];
                if ([indexes objectAtIndex:j] != randomIndex) {
                    [indexes addObject:randomIndex];
                    continue;
                }
                break;
            }
            NSNumber *indexValue = [indexes objectAtIndex:i];
            [self.DNA replaceObjectAtIndex:[indexValue integerValue]
                                withObject:[self.charsDNA objectAtIndex:arc4random()%[self.charsDNA count] ]];
        }
        
        
    }
    @catch (NSException *exception) {
        NSLog(@"Exception: %@", [exception debugDescription]);
    }
}


@end

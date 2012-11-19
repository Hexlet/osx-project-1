//
//  Cell.m
//  DNAapp
//
//  Created by Michael Krinitsky on 11/13/12.
//  Copyright (c) 2012 Michael Krinitsky. All rights reserved.
//

#import "Cell.h"


@implementation Cell

@synthesize getDNA = _getDNA;

- (NSMutableArray *) getDNA
{
    return DNA;
}

+ (NSString *) randomAmino
{
    NSString *retval = @"";
    int current_rand = abs((int)arc4random()) % 4 + 1;
    if (current_rand == 1)
    {
        retval = @"A";
    } else if (current_rand == 2)
    {
        retval = @"T";
    } else if (current_rand == 3)
    {
        retval = @"G";
    } else
    {
        retval = @"C";
    }
    return retval;
}

- (id) init
{
    self = [super init];
    
    if (self)
    {
        DNA = [[NSMutableArray alloc] init];
        for (int ind = 0; ind<100; ind++)
        {
            [DNA addObject:[[self class] randomAmino]];
            /*
            int current_rand = (int)arc4random() % 4 + 1;
            if (current_rand == 1)
            {
                [DNA addObject:@"A"];
            } else if (current_rand == 2)
            {
                [DNA addObject:@"T"];
            } else if (current_rand == 3)
            {
                [DNA addObject:@"G"];
            } else
            {
                [DNA addObject:@"C"];
            }
             */
        }
        NSLog(@"%@", [DNA componentsJoinedByString:@""]);
    }
    
    return self;
}





- (int) hammingDistance:(NSMutableArray *) DNA2
{
    int humDist = 0;
    if ([DNA2 count] != [DNA count])
    {
        NSLog(@"Невозможно посчитать расстояние Хэмминга: размеры ДНК не совпадают.");
        return 0;
    }
    
    for (int cnt = 0; cnt < [DNA count]; cnt++)
    {
        if ([DNA objectAtIndex:cnt] != [DNA2 objectAtIndex:cnt])
        {
            humDist++;
        }
    }
    
    return humDist;
}



@end

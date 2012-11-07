//
//  Cell.m
//  osx-project-1
//
//  Created by m g on 11/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell

// Constructor
-(id)init
{
    self = [super init];
    if (self)
    {
        DNA = [NSMutableArray arrayWithCapacity:DNA_DIMENTION];
        if (DNA)
        {
            [self initDNA];
        }
    }
    return self;
}

// init the DNA array
-(void)initDNA
{
    for (int i = 0; i < DNA_DIMENTION; i++)
    {
        enum DNALetters letter = rand()%letterLast;
        [DNA addObject:[NSNumber numberWithInt:letter]];
    }
}

//
-(enum DNALetters)getLetterByIndex:(int) index
{
    return [[DNA objectAtIndex:index] intValue];
}

// Get Distance
-(int)hummingDistance:(Cell *)anotherDNA
{
    int differents = 0;
    
    for (int i = 0 ; i < DNA_DIMENTION; i++)
    {
        if ( [self getLetterByIndex:i] == [anotherDNA getLetterByIndex:i] ) differents++;
    }
                  
    return differents;
}

// Print it
-(void)print
{
    NSString *str = [[NSString alloc] init];
    
    for ( int i = 0; i < DNA_DIMENTION; i++ )
    {
        switch ([self getLetterByIndex:i])
        {
            case leterA:
                str = [str stringByAppendingString:@"A"];
                break;
            case letterC:
                str = [str stringByAppendingString:@"C"];
                break;
            case letterG:
                str = [str stringByAppendingString:@"G"];
                break;
            case letterT:
                str = [str stringByAppendingString:@"T"];
                break;
            default:
                break;
        }
    }
    
    NSLog(str);
}

@end

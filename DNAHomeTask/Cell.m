//
//  Cell.m
//  DNAHomeTask
//
//  Created by Andrei Tsukanov on 11/2/12.
//  Copyright (c) 2012 Andrei Tsukanov. All rights reserved.
//

#import "Cell.h"
#import "stdlib.h"

@implementation Cell

int const numOfDNAElements = 100;

static NSArray* DNAElements;

-(id)init
{
    self = [super init];
    
    if (self) {
        [Cell initDNAElements];
        _DNA = [[NSMutableArray alloc] init];
        for (int i = 0; i < numOfDNAElements; i++)
        {
            [_DNA addObject: [DNAElements objectAtIndex:(arc4random() % DNAElements.count)] ];
        }
    }
    
    return self;
}

-(void)setRandomElementAtIndex:(NSInteger)index
{
    [_DNA replaceObjectAtIndex:index withObject:[DNAElements objectAtIndex:arc4random() % 4]];
}

-(int)hammingDistance:(Cell *)c
{
    int count = 0;
    for (int i = 0; i < numOfDNAElements; i++)
    {
        if (![[_DNA objectAtIndex:i] isEqual:[c.DNA objectAtIndex:i]])
        {
            count++;
        }
    }
    return count;
}

//init static array inclusive elements list
//init only once at run
+(NSArray *) initDNAElements
{
    if (DNAElements == nil)
    {
        DNAElements = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    }
    return DNAElements;
}
@end


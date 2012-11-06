//
//  Cell.m
//  osx-project-1
//
//  Created by mac mini on 04.11.12.
//  Copyright (c) 2012 hexlet. All rights reserved.
//

#import "Cell.h"


@implementation Cell
- (NSString *)getNewGenom
{
    NSString *charValue;
    NSInteger value = arc4random_uniform(4);
    switch(value)
    {
        case 0:
            charValue = @"A";
            break;
        case 1:
            charValue = @"T";
            break;
        case 2:
            charValue = @"G";
            break;
        case 3:
        default:
            charValue = @"C";
            break;
    }
    return charValue;
}

- (id) init
{
    self = [super init];
    if(self)
    {
        //init the DNA Array
        _DNA = [[NSMutableArray alloc] initWithCapacity:DNA_SIZE];
        //fill DNA Array
        NSInteger i = 0;
        while(i<100)
        {
            
            NSString* charValue = [[NSString alloc] init];
            charValue = [self getNewGenom];
            [_DNA insertObject:charValue atIndex:i];
            i++;
        }
        
    }
    return self;
        
}

- (int) hammingDistance:(Cell *)otherCell
{
    int result = 0;
    for (int i = 0; i<DNA_SIZE; i++)
    {
        if(_DNA[i]!=[otherCell DNA][i])
            result++;
    }
    return result;
}
@end

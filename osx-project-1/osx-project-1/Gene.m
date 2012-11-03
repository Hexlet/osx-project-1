//
//  Gene.m
//  osx-project-1
//
//  Created by Pavel Popchikovsky on 11/4/12.
//  Copyright (c) 2012 Pavel Popchikovsky. All rights reserved.
//

#import "Gene.h"

typedef enum
{
    A, T, G, C,
    TypesCount
} Type;

@implementation Gene
{
    Type value;
}

-(id) initWithRandomValue
{
    self = [super init];
    if(self)
        value = rand() % TypesCount;
    return self;
}

-(bool) equalsTo:(Gene *)gene
{
    return (self->value == gene->value);
}

-(NSString *) toString
{
    switch(value)
    {
        case A:
            return @"A";
        case T:
            return @"T";
        case G:
            return @"G";
        case C:
            return @"C";
        default:
            return nil;
    }
}

-(void) mutate
{
    int circularShift = 1 + rand() % (TypesCount - 1);
    value = (value + circularShift) % TypesCount;
}

@end

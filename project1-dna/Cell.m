//
//  Cell.m
//  project1-dna
//
//  Created by divermak on 07.11.12.
//
//

#import "Cell.h"
#import <stdio.h>

@implementation Cell

-(Cell*) init
{
    self = [super init];
    if (self)
    {
        NSInteger numItems = 100;
        
        _DNA = [NSMutableArray arrayWithCapacity:numItems];
        [self initDNA: numItems];
    }
    
    return self;
}

-(void) print
{
    NSInteger count = [_DNA count];
    for (int i = 0; i<count; i++) {
        printf("%s", [(NSString *)[_DNA objectAtIndex:i] UTF8String]);
    }
    printf("\r\n");
}

-(void) initDNA: (NSInteger)count
{
    for (int i = 0; i<count;i++) {
        [_DNA addObject:[self randomNucleobase]];
    }
}

-(NSString *) randomNucleobase
{
    NSString* nucleobase;
    int r = arc4random() % 4;
    switch (r) {
        case 0:
            nucleobase = @"A"; // adenine
            break;
        case 1:
            nucleobase = @"T"; // thymine
            break;
        case 2:
            nucleobase = @"G"; // guanine
            break;
        case 3:
            nucleobase = @"C"; // cytosine
        default:
            break;
    }
    return nucleobase;
}

-(NSString *) nucleobaseAtIndex: (int) index
{
    return [_DNA objectAtIndex:index];
}

-(int) nucleobasesCount
{
    return (int)[_DNA count];
}

-(int) hammingDistance: (Cell *) other
{
    int distance = 0;
    if (other != Nil && [other nucleobasesCount] == [self nucleobasesCount]) {
        
        for (int i = 0; i < [_DNA count]; i++)
        {
            NSString* nucleobase = [other nucleobaseAtIndex:i];
            if (![nucleobase isEqualToString:[self nucleobaseAtIndex:i]])
            {
                distance++;
            }
        }
    }
    
    return distance;
}

@end

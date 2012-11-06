//
//  Cell.m
//  DNA
//
//  Created by Ivancov Alexander on 11/3/12.
//  Copyright (c) 2012 GameStore. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init
{
    self = [super init];
    if (self)
    {
        NSArray *typeHromosome = @[@"A", @"T", @"G", @"C"];
        _DNA = [[NSMutableArray alloc] init];
        
        // Автозаполнение хромосом в ДНК
        for (int i = 0; i < 100; ++i)
        {
            int rand = arc4random()%4;
        
            [self.DNA  addObject: [typeHromosome objectAtIndex: rand]];
        }
    }
    
    return self;
}

- (void)print
{
    NSString *str = @"";
    for (NSInteger i = 0; i < 100; ++i) {
        str = [str stringByAppendingString: [_DNA objectAtIndex: i]];
    }
    NSLog(@"%@", str);
}

- (int)hammingDistanceDNA:(Cell *)otherDNA
{
    int distance = 0;
    
    for(NSInteger i = 0; i < 100; ++i)
    {
        // поэлементное сравнение двух списков хромосом
        if([[self.DNA objectAtIndex: i]  isEqual: [otherDNA.DNA objectAtIndex: i]])
        {
            ++distance;
        }
    }
    
    return distance;
}

@end



//
//  Cell.m
//  osx-project-1
//
//  Created by Vadim on 03.11.12.
//  Copyright (c) 2012 Vadim. All rights reserved.
//

#import "Cell.h"

@implementation Cell
-(id) init {
    self = [super init];
    if (self)
    {
        _DNA = [NSMutableArray array];
        for (int i = 0; i <= 99; i++)
        {
            NSNumber *number = [NSNumber numberWithChar: [self randomChar]];
            [_DNA addObject:number];
        }
    }
    return self;
};

-(void) print {
    for (int i = 0; i <= 99; i++)
    {
        NSLog(@"%i, %c", i, [[_DNA objectAtIndex:i] charValue]);
    }
}

-(int) hammingDistance: (Cell*) F {
    int hd=0;
    for (int i = 0; i <= 99; i++)
    {
        // сравнение
        if ([[_DNA objectAtIndex:i] charValue] != [[F.DNA objectAtIndex:i] charValue]) ++hd;
    }
    return hd;
}

-(char) randomChar {
    // случайное число от 1 до 4
    srandom((unsigned)(mach_absolute_time() & 0xFFFFFFFF));
    int randomValue = 1 + (random() % 4);
    
    char randomChar;
    switch (randomValue) {
        case 1:
            randomChar = 'A';
            break;
        case 2:
            randomChar = 'T';
            break;
        case 3:
            randomChar = 'G';
            break;
        case 4:
            randomChar = 'C';
            break;
        default:
            break;
    }
    return randomChar;
}

@end

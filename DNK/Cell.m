//
//  Cell.m
//  DNK
//
//  Created by sidney on 01.11.12.
//  Copyright (c) 2012 sidney. All rights reserved.
//

#import "Cell.h"


@implementation Cell

-(id) init {
    self = [super init];
    _DNA = [[NSMutableArray alloc] initWithCapacity:100]; // инит целевого массива днк
    charSet = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil]; // инит массива из символов
    for (int i = 0; i<100; i++) {
        [_DNA insertObject:[self genCharSet] atIndex:i]; // заполнение
        }
    return self;
}

// Возвращает рандомный символ из набора ATGC
-(NSString *) genCharSet {
    NSString * dnaChar = [charSet objectAtIndex:(arc4random()%4)];
    return dnaChar;
}

-(int) hammingDistance: (Cell *) obj {
    int dist = 0;
    for (int i = 0; i<100; i++) {
        if ([self.DNA objectAtIndex:i] != [obj.DNA objectAtIndex:i]) { // если символы на одной позиции не совпадают ++distance
            dist++;
        }
    }
    return dist;
}

@end
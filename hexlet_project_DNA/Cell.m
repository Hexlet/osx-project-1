//
//  Cell.m
//  hexlet_project_DNA
//
//  Created by Igor Smirnov on 30.10.12.
//  Copyright (c) 2012 Igor Smirnov. All rights reserved.
//

#import "Cell.h"

@implementation Cell

// выбор случайного значения элемента ДНК
- (NSString *) getRandomPart {
    switch (arc4random() % 4) {
        case 0: return @"A";
        case 1: return @"T";
        case 2: return @"G";
        case 3: return @"C";
    }
    return nil;
}

// инициализация с длиной
- (Cell *) initWithLength: (int) len {
    // вот кстати, вопрос. я так или иначе сталкивался с ним, реализуя различные идеи:
    // а, может, все-таки в обособленных инициализаторах надо
    // [self init] вместо [super init]?
    self = [self init];
    if (self) {
        self.DNA = [NSMutableArray arrayWithCapacity: len];
        for (int i = 0; i < len; i++) {
            [self.DNA replaceObjectAtIndex: i withObject: [self getRandomPart]];
        }
    }
    return self;
}

// строка днк для NSLog(...)
- (NSString *) description {
    return [self.DNA componentsJoinedByString: @""];
}

// сравнение днк
- (int) hammingDistance: (Cell *) aCell {
    int d = 0;
    for (int i = 0; i < self.DNA.count; i++) {
        if (![[self.DNA objectAtIndex: i] isEqualToString: [aCell.DNA objectAtIndex: i]]) {
            d++;
        }
    }
    return d;
}

@end

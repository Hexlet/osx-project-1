//
//  Cell.m
//  DNA
//
//  Created by Администратор on 10/31/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import "Cell.h"

@implementation Cell

// инициализация
-(id) init {
    self = [super init];
    
    if (self) {
        _DNA = [[NSMutableArray alloc] initWithCapacity: DNA_CAPACITY];
        NSString *letter;
        
        // random init array from our possible letters
        for (int i = 0; i < DNA_CAPACITY; i++) {
            letter = [LETTERS substringWithRange: NSMakeRange(arc4random() % LETTERS.length, 1)];
            [_DNA addObject: letter];
        }
    }
    return self;
}

// расстояние междку клетками
-(int) hammingDistance: (Cell *) c {
    int distance = 0;
    
    for (int i = 0; i < DNA_CAPACITY; i++) {
        if ([self.DNA objectAtIndex: i] != [c.DNA objectAtIndex: i])
            distance++;
    }
    return distance;
}

// печатаем клетку
-(void) print {
    NSMutableString *s = [NSMutableString string];
    
    for (int i = 0; i < [_DNA count]; i++)
        [s appendString:[_DNA objectAtIndex: i]];
    NSLog(@"%@",s);
}

@end

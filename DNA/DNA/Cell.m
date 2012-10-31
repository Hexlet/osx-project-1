//
//  Cell.m
//  DNA
//
//  Created by Администратор on 10/31/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import "Cell.h"

@implementation Cell

// генерирует случ. элемент клетки
-(NSString*) generateRandomNucletoid {
    return [LETTERS substringWithRange: NSMakeRange(arc4random() % LETTERS.length, 1)];
}

// инициализация
-(id) init {
    self = [super init];
    
    if (self) {
        _DNA = [[NSMutableArray alloc] initWithCapacity: DNA_CAPACITY];
        
        // random init array from our possible letters
        for (int i = 0; i < DNA_CAPACITY; i++) {         
            [_DNA addObject: [self generateRandomNucletoid]];
        }
    }
    return self;
}

// расстояние междку клетками
-(int) hammingDistance: (Cell *) c {
    int distance = 0;
    
    for (int i = 0; i < DNA_CAPACITY; i++) {    
        if ([[self.DNA objectAtIndex: i] isNotEqualTo: [c.DNA objectAtIndex: i]])
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

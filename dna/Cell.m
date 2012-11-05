//
//  Cell.m
//  dna
//
//  Created by Konstantin Tumalevich on 31.10.12.
//  Copyright (c) 2012 Konstantin Tumalevich. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {
    self = [super init];
    
    if (self) {
        _dna = [[NSMutableArray alloc] init];
        //К сожалению я так и не придумал как это сделать константой
        _codes = [NSArray arrayWithObjects:  @"A", @"T", @"G", @"C", nil];
        
        for (int i=0; i<DNA_SIZE; i++) {
            [_dna insertObject: [self getCode] atIndex:i];
        }
    }
    return self;
}

- (int) hammingDistance:(Cell*) another {
    
    int difference = 0;
    
    for(int i=0;i<[_dna count]; i++) {
        if (_dna[i] != another.dna[i]) {
            difference++;
        }
    }
    return difference;
}

- (NSString*) getCode {
    return _codes[arc4random() % [_codes count]];
}

- (NSString*) getCode:(NSString *) oldCode {
    //Узнаем текущий индекс
    
    NSUInteger current_index = [_codes indexOfObject:oldCode];
    
    //Выбираем число от 1 до количества кодов
    
    NSUInteger offset = arc4random() % ([_codes count] - 2) + 1;
    
    //Выбираем новый оффсет
    
    NSUInteger new_offset = current_index + offset;
    
    //NSLog(@"Index %lu %s", current_index, oldCode);
    
    if (new_offset > ([_codes count] - 1)) {
        new_offset = new_offset - [_codes count];
    }
    
    NSString* new_code = [_codes objectAtIndex:new_offset];
    
    return new_code;
}

@end

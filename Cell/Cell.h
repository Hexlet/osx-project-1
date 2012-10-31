//
//  Cell.h
//  Cell
//
//  Created by padawan on 31.10.12.
//  Copyright (c) 2012 padawan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

// Структура ДНК
@property (nonatomic, readonly) NSMutableArray *DNA;

// Нуклеотиды
@property (nonatomic, readonly) NSArray *nucleotides;

// длина DNA
@property (readonly) int lengthOfDna;

- (void) print;
- (int)  hammingDistance: (Cell *) anotherDna;
@end

//
//  Cell.h
//  Cell
//
//  Created by padawan on 31.10.12.
//  Copyright (c) 2012 padawan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    // Структура ДНК
    NSMutableArray *DNA;
    
    // Нуклеотиды
    NSArray *nucleotides;
@private
    // длина DNA
    int lengthOfDna;
}

- (void) print;
- (int)  hammingDistance: (Cell *) anotherDna;
- (id) getDNA;
@end

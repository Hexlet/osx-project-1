//
//  Cell.m
//  DNAFactory
//
//  Created by Ilya Rezyapkin on 01.11.12.
//  Copyright (c) 2012 Ilya Rezyapkin. All rights reserved.
//

#import "Cell.h"

// Массив нуклеотидов
const NSString *nucleotides[] = {@"A", @"T", @"G", @"C"};

@implementation Cell

- (id) init {
    self = [super init];
    if (self) {
        _DNA = [NSMutableArray arrayWithCapacity:MAX_NUCLEOTIDES];
        
        // Заполняем цепочку случайными значениями
        for (int i = 0; i < MAX_NUCLEOTIDES; i++) {
            [_DNA addObject:[Cell getRandomNucleotide]];
        }
    }
    return self;
}

- (int) hammingDistance:(Cell *)_cell {
    int counter = 0;
    
    for (int i = 0; i < MAX_NUCLEOTIDES; i++) {
        if ([self.DNA[i] isEqualToString:_cell.DNA[i]]) {
            counter++;
        }
    }
    return counter;
}

+(NSString *)getRandomNucleotide {
    int nIndex = arc4random() % 4;
    return nucleotides[nIndex];
}

+(NSString *) mutateNucleotide:(NSString *) n {
    
    int nIndex = arc4random() % 4;
    NSString *temp = [NSString stringWithString:nucleotides[nIndex]];
    
    while ([n isEqualToString:temp]) {
        nIndex = arc4random() % 4;
        temp = [NSString stringWithString:nucleotides[nIndex]];
    }
    
    return temp;
}

- (void) print {
    NSLog(@"%@", self.DNA);
}

@end

//
//  Cell.m
//  DNA
//
//  Created by MacUser on 03.11.12.
//  Copyright (c) 2012 MacUser. All rights reserved.
//

#import "Cell.h"

@implementation Cell
-(id) init {
    // Инициализируем суперкласс
    self = [super init];
    // Инициализируем свойство dna массивом
    self.dna = [NSMutableArray arrayWithCapacity: 100];
    // Заполняем dna строками кодов
    int idx;
    for (idx=0; idx<100; idx++) {
        [self.dna addObject: [Cell getRandomCode]];
    }
    return self;
}

-(int) hammingDistance: (Cell*) otherCell {
    if (otherCell) {
        int idx;
        int diffCount = 0;
        for (idx=0; idx<100; idx++) {
            if ([self.dna objectAtIndex: idx] != [otherCell.dna objectAtIndex: idx]) {
                diffCount++;
            }
        }
        return diffCount;
    }
    else { // 
        return 100;
    }
}


+(NSString *) getRandomCode {
    NSArray const *codes = @[@"A", @"T", @"G", @"C"];
    return [codes objectAtIndex: arc4random_uniform(4)];
}

@end

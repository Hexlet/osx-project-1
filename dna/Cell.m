//
//  Cell.m
//  dna
//
//  Created by Администратор on 11/3/12.
//  Copyright (c) 2012 RightWay. All rights reserved.
//

#import "Cell.h"

@implementation Cell

//Метод Инициализации с Заполнением Свойства случайными значениями
-(id) init {
    self = [super init];
    if (self) {
        _DNA = [[NSMutableArray alloc] initWithCapacity:100];
        id codes[4] = { @"A", @"G", @"T", @"C"};
        
        for (int i = 0; i < 100; i++) {
            int index = arc4random() % 4;
            [_DNA addObject:codes[index]];
        }
    }
    return self;
}

//Метод выводящий количество различий в двух объектах класса
-(int) hammingDistance:(Cell *) secondDNA {
    int count = 0;
    for (int i = 0; i < 100; i++) {
        if (self.DNA[i] == secondDNA.DNA[i]) {
            count++;
        }
    }
    return count;
}

//Метод для смены одного значения в свойстве DNA с индеком - index значением - part
-(void) changeOneDNA:(NSNumber *)index by:(NSString *)part {
    _DNA[[index intValue]] = part;
}

//Метод для создания объекта
+(id) rise {
   return [[Cell alloc] init];
};

@end

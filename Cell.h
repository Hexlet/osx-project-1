//
//  Cell.h
//  DNA
//
//  Created by Ivancov Alexander on 11/3/12.
//  Copyright (c) 2012 GameStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

// Свойство только для чтения (автогенерация ДНК)
@property (readonly) NSMutableArray *DNA;

// Создание последовательности хромосом
- (id)init;
// Вывод в консоль данных о ДНК
- (void)print;
// Определение различия между ДНК своей и переданной по параметру
- (int)hammingDistanceDNA: (Cell *)otherDNA;

@end




//
//  Cell.h
//  dnk
//
//  Created by ssein on 30.10.12.
//  Copyright (c) 2012 ssein. All rights reserved.
//

#import <Foundation/Foundation.h>

// Длина цепочки ДНК
extern int const DNA_SIZE;

@interface Cell : NSObject
// массив с элементами ДНК
@property NSMutableArray *dna;
// Генератор случайного элемента ДНК ATGC
+(NSString *)getRandomElement;
// Генератор случайного элемента ДНКза исключением заданного
+(NSString *)getAnotherRandomElement: (NSString *) element;
// Метод, вычисляющий расхождение в ДНК
-(int)hammingDistance: (Cell *)c;
// Вывод ДНК
-(void)print;
@end

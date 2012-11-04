//
//  Cell.h
//  dna
//
//  Created by RightWa on 11/3/12.
//  Copyright (c) 2012 RightWay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
//Свойство DNA типа NSMutableArray
@property NSMutableArray *DNA;

//Метод для смены одного значения в свойстве DNA с индеком - index значением - part 
-(void) changeOneDNA:(NSNumber *)index by:(NSString *)part;
//Метод выводящий количество различий в двух объектах класса
-(int) hammingDistance:(Cell *) secondDNA;
//Метод для создания объекта
+(id) rise;

@end

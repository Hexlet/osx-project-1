//
//  Cell.h
//  Project 1 DNA
//
//  Created by bashtannik on 03.11.12.
//  Copyright (c) 2012 bashtannik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) NSMutableArray *DNA;

/* Возвращает массив DNA с нужным объемом и случайными данными */
+(NSMutableArray*)randomDNA:(int)withCapacity;

/* Возвращает случайный символ */
+(NSString*)randomChar;

/* Возвращает случайный символ, за исключением исключения */
+(NSString*)randomCharExclude:(NSString*)exclude;

/* Считает растояние Хэмминга в сравнении с собственным значением DNA */
-(int)hammingDistance: (Cell*)inCell;


@end

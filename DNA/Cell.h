//
//  Cell.h
//  DNA
//
//  Created by A ... on 11/6/12.
//  Copyright (c) 2012 check-engine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
+(NSString*)getDNACodeByNumber:(int)number;             // статический буквенный код (значение) ячейки для массива
-(id)init:(Cell*)cell;                                  // создание нового экземпляра копированием
-(void)print;                                           // вывод массива кодов
-(NSString*)getDNACodeAtIndex:(int)index;               // возвращает буквенный код (значение) ячейки по индексу
-(void)setDNACode:(NSString*)code AtIndex:(int)index;   // устанавливает новый буквенный код в ячейке по индексу
-(int)hammingDistance:(Cell*)toCell;                    // "дистанция" до кода в другом экземпляре
@end

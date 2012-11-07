//
//  Cell.h
//  DNKcompare
//
//  Created by VladIslav Khazov on 07.11.12.
//  Copyright (c) 2012 VladIslav Khazov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

// Основной массив, создаем свойство с методами 
@property NSMutableArray *DNA;

//Определяем функцию сравнения, входной параметр объект класса Сell
-(int) hammingDistance: (Cell *) otherCell;
@end

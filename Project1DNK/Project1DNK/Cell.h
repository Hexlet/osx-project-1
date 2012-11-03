//
//  Cell.h
//  Project1DNK
//
//  Created by Sergey on 02.11.12.
//  Copyright (c) 2012 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject { // определяем интерфейс класса Cell
    NSMutableArray * arrayATGC; //добавляем переменную arrayATGC класса Cell 
}

@property NSMutableArray* DNA; // определяем свойсво DNA класса Cell

-(int) hammingDistance:(Cell*) c; // определяем метод hammingDistance класса Cell,который возвращает int и принимает объект класса Cell

@end // конец определения класса Cell

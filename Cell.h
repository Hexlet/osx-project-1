//
//  Cell.h
//  DNA-1_HomeWork
//
//  Created by Sergii Savitskyi on 05.11.12.
//  Copyright (c) 2012 Musician. All rights reserved.
//

#import <Foundation/Foundation.h> 

//Обьявляем интерфейс Cell, наследуемый от NSObject

@interface Cell : NSObject 

//Вводим переменную массива DNA

@property (strong, nonatomic) NSMutableArray *DNA;

//Сравниваем два типа DNA

-(int)hammingDistance:(Cell *)c;

//Выводим на печать

-(void) print;


@end

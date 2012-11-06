//
//  Cell.h
//  hometask
//
//  Created by Дмитрий Голубев on 05.11.12.
//  Copyright (c) 2012 Дмитрий Голубев Inc. All rights reserved.
//

#import <Foundation/Foundation.h> // Основной фреймворк содержащий классы NSArray, NSDictionary, NSString ...

@interface Cell : NSObject //объявляем интерфейс и наследуемся от NSObject

@property (strong, nonatomic) NSMutableArray * DNA; // Переменная типа изменяемого массива

-(int)hammingDistance:(Cell *)c; // сравнивает свой ДНК и ДНК переданного в качестве аргумента 

@end

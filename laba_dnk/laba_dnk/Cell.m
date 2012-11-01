//
//  Cell.m
//  laba_dnk
//
//  Created by Smallkot on 31.10.12.
//  Copyright (c) 2012 Smallkot. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(NSString *)getEletmentArray{
    return [MassElementovDNK objectAtIndex:(arc4random() % 4)]; // возращает случайный элемент массива
}

-(int)hammingDistance:(Cell *)theCell{
    int aDistance = 0; // количество разных звений приравниваем к 0
    for (int i=0; i<[DNK count]; ++i) { // проходим по циклу весь массив ДНК
        if ([DNK objectAtIndex:i]!=[theCell->DNK objectAtIndex:i]) { // сравниваем элементы ДНК объекта и объекта который получили ввиде парамметра
            aDistance++; // если они не равны, то увеличиваем счетчик на 1
        }
    }
    return aDistance; // возращаем кол-во разных элементов ДНК
}
// инцилизация объекта класса Cell
-(id) init{
    self = [super init]; // вызов инцилизации суперкласса
    if (self) { // если не равен nil то инцилизируем объект
        DNK = [NSMutableArray   arrayWithCapacity:100]; // выделяем массиву ДНК память
        MassElementovDNK = [NSMutableArray arrayWithObjects: @"A", @"T",@"G",@"C", nil]; // инцилизируем размер массив элементы ДНК и заполняем его
        for (int i=0; i<100; ++i) { // заполняем по циклу случайными элементами массив ДНК
            [DNK addObject:self.getEletmentArray];
        }
    }
    return self;
}

-(void) print{
    NSLog(@"%@", [DNK componentsJoinedByString:@""]); // выводим массив ДНК
    // функция componentsJoinedByString:@"" объеденяет все элементы массива в строку и между ними не оставляет пространства, а если
    // между кавычками поставить знак или проблем или целое слово, то оно будет выводить между каждым элементом
    // удобная функция
}

@end

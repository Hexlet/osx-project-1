//
//  Protein.h
//  DNA
//
//  Created by Александр Борунов on 01.11.12.
//  Copyright (c) 2012 Александр Борунов. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Protein : NSObject {
    char type;
}
- (void)setA;  // установить тип аминокислоты в A
- (void)setT;  // установить тип аминокислоты в T
- (void)setG;  // установить тип аминокислоты в G
- (void)setC;  // установить тип аминокислоты в C
- (void)setRand; // установить тип случайно
- (void)print;  // напечатать тип аминокислоты
- (char)get;   // получить тип аминокислоты

- (void)changeRand; // изменить тип случайно
@end


// класс Protein предназначен для хранения типа аминокислоты из которой состоит ДНК
// то есть массив будет хранить именно обьекты класса Protein
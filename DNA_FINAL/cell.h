//
//  Cell.h
//  DNA
//
//  Created by Пользователь Пользователь on 03.11.12.
//  Copyright (c) 2012 Работа. All rights reserved.
//
#define DNA_LENGTH 100   //размер ДНК

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSMutableArray *DNA; //Основной массив ДНК
    NSSet *set;          //Множество вариантов значений
}
//nonatomic,retain и переменные выше пишем для 32-битной системы xcode 4.2 без ARC
@property(nonatomic,retain) NSMutableArray *DNA;

-(void)print;
-(int)hammingDistance: (Cell *) DNA2;

@end


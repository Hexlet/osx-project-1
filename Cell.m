//
//  Cell.m
//  Project 1 DNA
//
//  Created by bashtannik on 03.11.12.
//  Copyright (c) 2012 bashtannik. All rights reserved.
//

#import "Cell.h"
#define MAX_DNA_ARRAY 100 // Размер генерируемого массива с символами

@implementation Cell

/*
 
 Конструктор
 
 При инициализации класса заполняет свойство массив DNA размером MAX_DNA_ARRAY
 случайными символами A T G и C
 
 */
-(id) init {
    
    self = [super init];
    if(self) {
        _DNA = [Cell randomDNA:MAX_DNA_ARRAY];
    }
    return self;
}

/*
 
 Метод класса, генерирующий массив с случайными символами A T G и С
 в указанном размере withCapacity
 
 withCapacity - int количество элементов в массиве
 
 */
+(NSMutableArray*)randomDNA:(int)withCapacity{
    NSMutableArray *DNA = [NSMutableArray arrayWithCapacity:withCapacity]; // метод withCapacity инициализирует объект коорректно, без необходимости alloc и init
    
    for (int i=0; i<withCapacity; i++) {
        [DNA addObject:[Cell randomChar]];
    }
    
    return DNA;
}

/* 
 
 Метод класса, генерирующий случайный символ A T G или C
 
 */

+(NSString*)randomChar{
    NSArray *chars = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil]; // Изменять массив не придется, поэтому выбрад NSArray
    NSUInteger random = arc4random() % 4; // unsigned
    return [chars objectAtIndex: random];
}

/*
 
 Метод класса, генерирующий случайный символ A T G или C
 за исключением символа, переданного в аргументе exclude
 
 exclude - NSString символ, исключаемый из случайной выдачи
 
 */

+(NSString*)randomCharExclude:(NSString *)exclude {
    NSArray *chars = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil]; // Изменять массив не придется
    NSUInteger random = 0;
    
    // Выполнять код до тех пор пока случайный символ равен исключаемому
    // т.е. добиться уникальности
    for(int i=0; (random=i) && [[chars objectAtIndex:i] isEqual:exclude]; i=arc4random() % 4);
    
    return [chars objectAtIndex: random];
    
}


/*
 
 Расчет расстояния Хэмминга
 Возвращает количество различных элементов в массивах DNA 
 по одному и тому же индексу в сравнении с свойством DNA 
 текущего объекта и объекта, переданного в аргументе inCell
 
 inCell - объект класса Cell
 
 */
-(int)hammingDistance: (Cell*)inCell {
    
    NSUInteger diffs = 0; //unsigned int || long
    
    for (int i=0; i<MAX_DNA_ARRAY; i++) {
        // Посимвольное сравнение
        if([[inCell.DNA objectAtIndex:i] isNotEqualTo:[self.DNA objectAtIndex:i]]){
            diffs++;
        }
    }
    
    return [NSNumber numberWithUnsignedInteger:diffs].intValue; // Приводим к типу int по требованию задания
}

@end

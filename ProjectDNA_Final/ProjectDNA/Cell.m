//
//  Cell.m
//  ProjectDNA
//
//  Created by Anton Samoylov on 02.11.12.
//  Copyright (c) 2012 Anton Samoylov. All rights reserved.
//

#import "Cell.h"

//Определяем констаты для будующего массива

@implementation Cell 

//Переписываем init
-(id) init {
    self = [super init];
    if (self){
        DNACapacity = 10;
        CharsCapacity = 4;
        //Инициализируем массив символов для вставки
        NSArray *NeironsDNA = [[NSArray alloc] initWithObjects:@"T",@"A",@"G",@"C", nil];
        DNA = [[NSMutableArray alloc] initWithCapacity:DNACapacity];
        int tempCount,tempCharForInsert;
        //Вставка объектов в массив
        for (tempCount=0; tempCount<DNACapacity; tempCount++) {
            //Идентификатор символа для вставки в массив
            tempCharForInsert = arc4random() % CharsCapacity;
            [DNA insertObject:NeironsDNA[tempCharForInsert] atIndex:tempCount];
        }
    }
    return self;
}

//Проверяем совпадения 
-(int) hammingDistance:(Cell *)hrefCell {
    int tempCount = 0,i;
    for (i=0; i<DNACapacity; i++) {
        if ([DNA objectAtIndex:i] != [hrefCell->DNA objectAtIndex:i]) {
            tempCount++;
        }
    }
    return tempCount;
}

+(NSString *)getRandomElement:(NSString *)element {
    NSArray *DNATypes;
    // Заполняем массив с возможными элементами цепочки
    if(DNATypes == nil) DNATypes = @[@"A", @"T", @"G", @"C"];
    //Геним новый элемент
    NSString *randomElement = DNATypes[arc4random() % [DNATypes count]];
    //Проверяем совпадают ли элементы
    if (randomElement == element) {
        if (randomElement == [DNATypes lastObject]){
            // Если это последний элемент, то берем первый
            randomElement = DNATypes[0];
        } else {
            // Если нет, то берем следущий
            randomElement = DNATypes[ ([DNATypes indexOfObject:randomElement]+1)];
        }
    }
    return randomElement;
}

//Распечатываем массив. Функция для тестов.
-(void) printArray {
    int i;
    for (i=0; i<DNACapacity; i++) {
        NSLog(@" Object %i = %@",i,[DNA objectAtIndex:i]);
    }
    NSLog(@"\n");
}
@end

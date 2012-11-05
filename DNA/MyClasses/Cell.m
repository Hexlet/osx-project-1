//
//  Cell.m
//  DNA
//
//  Created by Buxxter on 05.11.12.
//  Copyright (c) 2012 Buxxter. All rights reserved.
//

#import "Cell.h"

@implementation Cell
-(id) init {
    self = [super init]; // Инициализируем базовый класс
    if (!self) { return nil; } // Если экземпляр базового класса не создался по какой-либо причине, то также вернем nil
    _mDNA = [NSMutableArray array]; // свойство экземпляра с типом NSMutableArray - массив переменной длины
    _mStringView = [NSMutableString new]; // свойство - строковое представление объекта
    
    for (int i = 0; i<100; i++) { // открываем цикл в 100 проходов
        
        int tmp = 1 + (random() % 5); // генерируем псевдослучайное число в диапазоне от 1 до 4
        
        if (tmp == 1) { // Если сгенерированное число равно 1
            [_mDNA addObject:@"A"]; // добавляем очередной элемент массива с типом NSString и значением "A"
            [_mStringView appendString: @"A"]; // добавляем в строковое прдставление такую же "A". Можно воспользоваться методом createStringView, но зачем нам лишний цикл, раз уж открыли один?
        } else if (tmp == 2) {
            [_mDNA addObject:@"T"];
            [_mStringView appendString: @"T"];
        } else if (tmp == 3) {
            [_mDNA addObject:@"G"];
            [_mStringView appendString: @"G"];
        } else {
            [_mDNA addObject:@"C"];
            [_mStringView appendString: @"C"];
        }
        
    }
    return self; // инициализация должна вернуть сформированный объект
}

// Метод для создания строкового представления (в виде одной строки)
-(void)createStringView {
    _mStringView = [NSMutableString new]; // Очищаем значение свойства
    
    for (NSString *curr in _mDNA) { // цикл для каждого из элементов mDNA
        [_mStringView appendString:curr]; // добавляем текущий элемент в строку
    }
    
}

-(int) hammingDistance: (Cell*) otherCell {
    
    /* Поскольку у нас только один конструктор, позволяющий создать объект с сотней элементов (не больше и не меньше), то сравнивать их размеры нет смысла.
     Просто сравниваем каждый элемент в цикле
    */
    
    int forReturn = 0; // счетчик несовпадений
    
    for (int i = 0; i<100; i++) {
        if ([_mDNA objectAtIndex:i] != [[otherCell mDNA] objectAtIndex:i]) {
            forReturn = forReturn + 1; // Если элементы массивов с текущим индексом не равны, то увеличиваем значение счетчика несовпадений
        }
    }
    
    return forReturn; // Возвращаем текущее значение счетчика несовпадений
}

@end

@implementation Cell (mutator)

-(Cell*)mutateOn:(uint)percents {
    
    if (percents == 0) { return self; } // не меняем на 0 процентов
    
    NSMutableArray *indexesToChange = [NSMutableArray new]; // Массив индексов, которые будем менять
    
    /*
     следующий цикл генерит массив случайных чисел (без повторений) размерностью [percents]
     */
    do {
        NSNumber *newIndex = [NSNumber numberWithUnsignedInt: random() % 100]; // очередное случайное число в диапазоне 0 - 99

        if (![indexesToChange containsObject:newIndex]) { // проверка: не сгенерили ли такое число ранее?
            [indexesToChange addObject:newIndex]; // все норм, пополняем массив индексов для изменения
        }
        
    } while ([indexesToChange count] < percents); // если сгенерили остаточное количество случайных чисел - завершаем цикл
    
    NSArray *tmp = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil]; // из этого массива будем брать новые случайные "хромосомы"
    
    // Открываем цикл для каждого из случайных индексов
    for (NSNumber *curIndex in indexesToChange) {
        NSString *currentChromosome = [_mDNA objectAtIndex:[curIndex unsignedIntegerValue]]; // запишем в переменную значение изменяемого элемента (для удобства)
        
        NSString *rndChromosome = [tmp objectAtIndex:random() % 4]; // Возьмем случайную хромосому из временного массива
        
        do {
            rndChromosome = [tmp objectAtIndex:random() % 4];
        } while (rndChromosome == currentChromosome); // если случайная хромосома совпала с текущей - возьмем другую случайную
        
        [_mDNA setObject:rndChromosome atIndexedSubscript:[curIndex unsignedIntegerValue]]; // заменим хромосому с обрабатываемым индексом на найденную случайную
        
        
    }
    
    self.createStringView; // обновим строковое представление объекта

    return self;
}

@end



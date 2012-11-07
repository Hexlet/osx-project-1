//
//  NSObject+mutate.m
//  DNA
//
//  Created by Пользователь Пользователь on 03.11.12.
//  Copyright (c) 2012 Работа. All rights reserved.
//

#import "mutate.h"

@implementation Cell (mutator)

//Реализация метода для замены n-уникальных значений ДНК
-(void)mutate:(int)n {

//Выполняем мутацию если n отлична от 0%
if (n!=0) {
    
//Производим перерасчет процентов в зависимости от длины ДНК
n = (float)n/100 * DNA_LENGTH;
    
//Создадим и заполним массив n-возрастающих значений для перемешивания
//Значения будут являться индексами для замены в ДНК
    int A[DNA_LENGTH];
    for (int i=0;i<DNA_LENGTH;i++) A[i]=i; //12345 для DNA_LENGTH=5
//Перемешиваем массив в случайном порядке
    int tmp,rnd;
    for (int i=0;i<DNA_LENGTH;i++) {
        rnd = arc4random()%DNA_LENGTH; //выбираем случайную позицию для обмена и меняем местами
        tmp = A[i];
        A[i] = A[rnd];
        A[rnd] = tmp;
    }

//Теперь например A=53241    
//Генерируем случайные значения в позициях из массива А
//При этом проверяем чтобы новое значение отличалось от старого
    NSString *str;
    str = [[NSString alloc] init];
    for (int i=0;i<n;i++){
        //генерируем новое значение
        do {
        str = [[set allObjects] objectAtIndex:arc4random()%4];
        //до тех пор пока не получим действительно новое
        //вероятность промаха генератора 25% (1 из 4)
        } while ([[self DNA] objectAtIndex:A[i]]==str);
    //меняем значения как только сгенерировали отличное
    [[self DNA] replaceObjectAtIndex:A[i] withObject:str];
    }
    [str release];
 } //if
    
}

@end

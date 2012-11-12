//
//  Cell+mutator.m
//  DNA
//
//  Created by Администратор on 11/7/12.
//  Copyright (c) 2012 Nope. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void) mutate:(int)percent{
    if ((percent > 0) && (percent <= 100)){                                                         //Проверяем на допустимость входного значения
        NSLog(@"Starting mutation to %i%%...", percent);
        NSDate *timer = [NSDate date];                                                              //Таймер для замера времени мутации
        NSInteger nucleotidesToMutate = [DNA count]/100*percent;                                    //Переменная, хранящая число мутаций, если размер массива отличен от 100
        NSInteger turns = 0;                                                                        //Для подсчета общего числа циклов
        NSNumber *randomIndex;                                                                      //Для временного хранения случайного числа
        NSMutableArray *mutatedIndex = [NSMutableArray arrayWithCapacity:(nucleotidesToMutate)];    //Массив с индексом мутаций
        for (int i=0; [mutatedIndex count]<nucleotidesToMutate;){                                   //Цикл работает, пока не заполнится массив индекса мутаций
            randomIndex = [NSNumber numberWithInt:(arc4random() % [DNA count])];
            if (![mutatedIndex containsObject:randomIndex]){                                        //Если такого индекса еще не было
                [mutatedIndex addObject:randomIndex];                                               //заносим его в массив с индексом мутаций
                [self randomNucleotideAtIndex:[randomIndex intValue]];                              //и мутируем нуклеотид по этому индексу
                i++;
            }
            turns++;
        }
        NSLog(@"...done in %f seconds and %li turns.",-[timer timeIntervalSinceNow], turns);
    }
}

-(void) randomNucleotideAtIndex: (int) Index{                                                       //Решаем задачу "в лоб"
    NSMutableArray *nucleotides = [NSMutableArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];   //Создаем массив нуклеотидов
    [nucleotides removeObjectIdenticalTo: [DNA objectAtIndex:Index]];                               //Убираем из него нуклеотид, идентичный заменяемому
    [DNA replaceObjectAtIndex:Index withObject:[nucleotides objectAtIndex:arc4random_uniform(3)]];  //Заменяем на случайный нуклеотид из оставшихся трех
}

@end

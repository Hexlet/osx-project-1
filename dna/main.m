//
//  main.m
//  dna
//
//  Created by Maksim Kuleshov on 02.11.12.
//  Copyright (c) 2012 Maksim Kuleshov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
-(void)mutate:(int)percentForSuffle;
@end

@implementation Cell (Mutator)

-(void)mutate:(int)percentForSuffle {
    if (percentForSuffle > 100) {percentForSuffle = 100;}//Проверяем входящее значение, что бы процент не превышал 100%.
    if (percentForSuffle < 0) {percentForSuffle = 0;}//Проверяем входящее значение, что бы процент не был меньше 0%.
    
    NSInteger lengthOfDNA = [self.DNA count];//Узнаём длину ДНК, в моей программе можно создать ДНК меньше чем 100 (это сделал просто для развлечения, надеюсь проверку это не усложнит).
    
    NSMutableArray *indexesForSuffle = [NSMutableArray arrayWithCapacity:lengthOfDNA];//Создаём массив номеров индексов (нуклеотидов) которые в последствии мутируем, равен длине ДНК.
    for (int i=0; i<lengthOfDNA; i++) {
        [indexesForSuffle addObject:[NSString stringWithFormat:@"%d",i]];
    }
    //После цикла массив indexesForSuffle имеет вид @[@"0",@"1",@"2"...@"99"]
    
    float countIndexesForNotSuffle = lengthOfDNA - round(lengthOfDNA/100.0*percentForSuffle);//Вычисляем количество нуклеотидов, которые не должны быть мутированны
    for (int i=0; i<countIndexesForNotSuffle; i++) {
        [indexesForSuffle removeObjectAtIndex:(arc4random() % (lengthOfDNA - i))];//и удаляем это количество из массива индексов.
    }
    //После цикла в массиве остались только те индексы (позиции нуклеотидов) которые должны быть мутированны. Например получаем масив indexesForSuffle в виде @[@"0",@"3",@"4",@"6"...].
    //NSLog(@"Индексы для мутированния: %@",indexesForSuffle);
    
    NSInteger countIndexesForSuffle = [indexesForSuffle count];//Вычисляем количество нуклеотидов, которые должны быть мутированны.
    NSMutableArray *setOfDNAWithoutCurrent = [NSMutableArray arrayWithCapacity:[self.setOfDNA count]];//Этот масив используем чтобы при каждом проходе помещать в него массив со всеми типами нуклиоидов и удалять из него текущий. То есть на выходе получам масив возможных нуклиоидов без текущего, что бы однозначно изменился тип нуклиоида.
    for (int i=0; i<countIndexesForSuffle; i++) {
        [setOfDNAWithoutCurrent addObjectsFromArray:self.setOfDNA];//Заполняем временный массив набором типов нуклеотидов.
        //NSLog(@"Оригинальны набор типов нуклеотидов: %@",setOfDNAWithoutCurrent);
        //NSLog(@"Текущий тип нуклиотида: %@",[self.DNA objectAtIndex:[[indexesForSuffle objectAtIndex:i] integerValue]]);
        [setOfDNAWithoutCurrent removeObject:[self.DNA objectAtIndex:[[indexesForSuffle objectAtIndex:i] integerValue]]];//Удаляем из массива вид текущего нуклеотида.
        //NSLog(@"Набор оставшихся вариантов типов нуклеотидов: %@",setOfDNAWithoutCurrent);
        
        [self.DNA replaceObjectAtIndex:[[indexesForSuffle objectAtIndex:i] integerValue] withObject:[setOfDNAWithoutCurrent objectAtIndex:(arc4random() % 3)]];//Заменяем позицию в ДНК по индексу из массива indexesForSuffle на тип нуклеотида выбранного рандомно из массива нуклеотидов setOfDNAWithoutCurrent в котором нет текущего нуклеотида.
        //NSLog(@"Заменили на: %@",[self.DNA objectAtIndex:[[indexesForSuffle objectAtIndex:i] integerValue]]);
        [setOfDNAWithoutCurrent removeAllObjects];//Очищаем массив, чтоб при следующем проходе заполнить его полным набором возможных нуклеотидов.
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *dna1, *dna2;
        dna1 = [[Cell alloc] initWithLength:100];
        dna2 = [[Cell alloc] initWithLength:100];
        //NSLog(@"Начальная ДНК1: %@",dna1.DNA);
        //NSLog(@"Начальная ДНК2: %@",dna2.DNA);
        NSLog(@"Начальная hammingDistance: %i",[dna1 hammingDistance:dna2]);
        
        [dna1 mutate:30];
        //NSLog(@"Мутированная ДНК1: %@",dna1.DNA);
        [dna2 mutate:60];
        //NSLog(@"Мутированная ДНК2: %@",dna2.DNA);
        NSLog(@"После мутирования hammingDistance: %i",[dna1 hammingDistance:dna2]);
    }
    return 0;
}


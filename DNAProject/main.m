//
//  main.m
//  DNAProject
//
//  Created by S.Lebedev on 30.10.12.
//  Copyright (c) 2012 S.Lebedev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator) // категория Mutator класса Cell
-(void)mutate:(int)x; //в этой категории объявлен только один метод - mutate
@end

@implementation Cell (Mutator) // имплементация категории Mutator
// Метод mutate нам нужен, чтобы сформировать новую ДНК, изменив х% исходной последовательности
-(void)mutate:(int)x{
    // если неверно задан процент изменения, дальнейшие действия бессмысленны
    NSCAssert((x>0&&x<=100), @"Invalid x value for mutating!");
/*    if (x<0||x>100) {
        @throw [NSException exceptionWithName:@"InvalidXInMutator" reason:[NSString stringWithFormat:@"Invalid value %i!",x] userInfo:nil];
    }*/
    NSUInteger randomKey = 0; //случайный ключ индекса заменяемого символа
    NSUInteger amount = lroundf((capacityOfDNA*x)/100.0f); // кол-во символов для изменения (x - процентный показатель)
    id sourceGene,modifiedGene; //переменные для анализа исходного символа и модифицированного символа
    NSMutableArray *indexes = [[NSMutableArray alloc] initWithCapacity:capacityOfDNA];
    for (int i=0; i<capacityOfDNA; i++) {
        [indexes addObject:[NSNumber numberWithInt:i]];
    }
    for (int modified=0;modified<amount;modified++) {
        // сначала сформируем случайным образом индекс, по которому будем обращаться
        // немаловажное условие - чтобы элемент по одному индексу менялся ровно один раз
        randomKey = arc4random() % [indexes count]; // формируем ключ
        NSUInteger indexToModify = [[indexes objectAtIndex:randomKey] integerValue]; // запоминаем индекс, чтобы по десять раз не посылать сообщения
        sourceGene = [[self DNA] objectAtIndex:indexToModify]; // запоминаем исходное значение в последовательности по индексу
        // и меняем значение символа, помня о том, что оно в любом случае должно отличаться от исходного!
        do {
            modifiedGene = gene[(arc4random() % capacityOfGene)];
        } while ([sourceGene isEqualToString:modifiedGene]);
        [DNA replaceObjectAtIndex:indexToModify withObject:modifiedGene]; // всё хорошо, есть новый символ!
        [indexes removeObjectAtIndex:randomKey]; // не забываем исключить использованный индекс
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Cell *myCell = [[Cell alloc] init]; // первая ДНК
        NSLog(@"%@",myCell);
        Cell *myCell2 = [[Cell alloc] init]; // вторая ДНК
        NSLog(@"%@",myCell2);
        NSLog(@"Hamming distance: %d",[myCell hammingDistance:myCell2]);
        // модифицируем обе ДНК
        [myCell mutate:56];
        [myCell2 mutate:37];
        NSLog(@"%@",myCell);
        NSLog(@"%@",myCell2);
        NSLog(@"Hamming distance: %d",[myCell hammingDistance:myCell2]);
        
    }
    return 0;
}


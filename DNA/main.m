//
//  main.m
//  DNA
//
//  Created by Max Lebedev on 04.11.12.
//  Copyright (c) 2012 mlebedev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void) mutate:(int) i;

@end

@implementation Cell (mutator)

-(void) mutate:(int)percent{
    unsigned int valueRandom, itemRandom, X;
    NSMutableArray *itemRandoms = [[NSMutableArray alloc] initWithCapacity:100];
    NSMutableArray *kindsOfCharWithoutChangeValue = [[NSMutableArray alloc] initWithCapacity:4];
    
    // заполняем массив от 0 до 100, из него будем выбирать случайные значения, а использованные удалять
    for (int i = 0; i<[[self dna] count]; i++) {
        [itemRandoms addObject:[[NSNumber alloc] initWithInt:i]];
    }
    
    // переводим процент в количество (на случай, если количество элементов отличное от 100 приходится высчитывать, чему будет равен процент)
    X = lroundf([[self dna] count] * percent / 100);
    
    unsigned int i = 0;
    // пока не заменим все X процентов
    while (i<X) {
        // индекс нового вида днк
        valueRandom = arc4random() % 3;
        // индекс заменяемого элемента
        itemRandom = arc4random() % [itemRandoms count];
        // создаем новый массив с видами ДНК, удаляем вид днк текущего элемента
        kindsOfCharWithoutChangeValue = [[NSMutableArray alloc] initWithArray:self.kindsOfChar];
        [kindsOfCharWithoutChangeValue removeObject:[self.dna objectAtIndex:[[itemRandoms objectAtIndex:itemRandom] intValue]]];
        
        // заменяем на новое значение
        [[self dna] replaceObjectAtIndex:[[itemRandoms objectAtIndex:itemRandom] intValue] withObject:[kindsOfCharWithoutChangeValue objectAtIndex:valueRandom]];
        // удаляем уже использовавшееся число
        [itemRandoms removeObjectAtIndex:itemRandom];
        
        i++;
        
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // создаем объекты
        Cell *myCell1, *myCell2;
        myCell1 = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        
        // выводим hamming distance
        NSLog(@"Hamming distance между объектами равен %i",[myCell1 hammingDistance:myCell2]);
        
        // мутируем 80 процентов
        [myCell1 mutate:80];
        [myCell2 mutate:80];
        
        // выводим новый hamming distance
        NSLog(@"Mutated hamming distance между объектами равен %i",[myCell1 hammingDistance:myCell2]);

        
    }
    return 0;
}


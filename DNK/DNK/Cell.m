//
//  Cell.m
//  DNK
//
//  Created by Danil Galeev on 03.11.12.
//  Copyright (c) 2012 Danil Galeev. All rights reserved.
//

#import "Cell.h"
#include <stdlib.h>


@interface NSMutableArray (Shuffling)
-(void)shuffle;
@end


@implementation NSMutableArray (Shuffling)

-(void)shuffle
//Метод для случайного перемешивания NSMutableArray
{
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end


@implementation Cell

-(id) init {
    self = [super init];
    _dnksybol = [[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C", nil];
    if (self) {
        _dnk = [[NSMutableArray alloc] initWithCapacity: 100];
        for (int i=0; i<100; i++) {
            [_dnk addObject: [self getRandomDnkSymbol]];
        }
    }
    return self;
}

-(NSString *) getRandomDnkSymbol {
    //Вспомогательный метод для получения случайного символа ДНК
    int randIndex = arc4random() % [_dnksybol count];
    NSString *nextDnkSymbol;
    nextDnkSymbol = [_dnksybol objectAtIndex: randIndex];
    return nextDnkSymbol;
}

-(int) hammingDistance: (Cell *)cell {
    int counter = 0;
    for (int i=0; i<100; i++) {
        if([self.dnk objectAtIndex:(i)] != [cell.dnk objectAtIndex:(i)]) {
            counter++;
        }
    }
    return counter;
}

-(void) mutate: (int)x {
    // Алгоритм: создаем массив из чисел 0-99 соответствующих индексам
    // массива dnk. Перемешиваем массив, в цикле обходим первые x элементов
    // и меняем значение в dnk находящееся по данному индексу на другое.
    NSMutableArray *indexesToMutate;
    indexesToMutate = [[NSMutableArray alloc] initWithCapacity: 100];
    for (int i=0; i<100; i++) {
        [indexesToMutate addObject: [NSNumber numberWithInt: i]];
    }
    [indexesToMutate shuffle];
    
    NSString *dnkSymbol;
    for (int i=0; i<x; i++) {
        int indexToMutate = [[indexesToMutate objectAtIndex: i] intValue];
        do {
            dnkSymbol = [self getRandomDnkSymbol];
        } while (dnkSymbol == [_dnk objectAtIndex: indexToMutate]);
        [_dnk replaceObjectAtIndex: indexToMutate withObject: dnkSymbol];
    }
}

@end

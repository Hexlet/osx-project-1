//
//  Cell+Mutating.m
//  DNK
//
//  Created by Danil Galeev on 05.11.12.
//  Copyright (c) 2012 Danil Galeev. All rights reserved.
//

#import "Cell+Mutating.h"
#import "NSMutableArray+Shuffling.h"


@implementation Cell (Mutating)

-(void) mutate: (int)x {
    // Алгоритм: создаем массив из чисел индексов соответствующих индексам
    // массива dnk. Перемешиваем массив, в цикле обходим первые x элементов
    // и меняем значение в dnk находящееся по данному индексу на другое.
    NSMutableArray *indexesToMutate;
    indexesToMutate = [[NSMutableArray alloc] initWithCapacity: [self.dnk count]];
    for (int i=0; i<[self.dnk count]; i++) {
        [indexesToMutate addObject: [NSNumber numberWithInt: i]];
    }
    [indexesToMutate shuffle];
    
    // Вычисляем количество символов для замены исходя из процентов
    int needsToReplace = round([self.dnk count] * x * 0.01);
    
    NSString *dnkSymbol;
    for (int i=0; i<needsToReplace; i++) {
        int indexToMutate = [[indexesToMutate objectAtIndex: i] intValue];
        do {
            dnkSymbol = [self getRandomDnkSymbol];
        } while ([dnkSymbol isEqualToString: [self.dnk objectAtIndex: indexToMutate]]);
        [self.dnk replaceObjectAtIndex: indexToMutate withObject: dnkSymbol];
    }
}

@end

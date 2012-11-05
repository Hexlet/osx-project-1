//
//  main.m
//  DNK
//
//  Created by Danil Galeev on 03.11.12.
//  Copyright (c) 2012 Danil Galeev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


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


@interface Cell (Mutating)
    -(void) mutate: (int)x;
@end

@implementation Cell (Mutating)

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
        } while (dnkSymbol == [self.dnk objectAtIndex: indexToMutate]);
        [self.dnk replaceObjectAtIndex: indexToMutate withObject: dnkSymbol];
    }
}

@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *myCell1;
        Cell *myCell2;
        myCell1 = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        NSLog(@"%i", [myCell1 hammingDistance: myCell2]);
        [myCell1 mutate: 50];
        [myCell2 mutate: 75];
        NSLog(@"%i", [myCell1 hammingDistance: myCell2]);
    }
    return 0;
}


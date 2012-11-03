//
//  main.m
//  2 DNA
//
//  Created by Vf on 30.10.12.
//  Copyright (c) 2012 Vf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell(mutator)

- (void) mutate: (int) X;

@end


@implementation Cell(mutator)

- (void) mutate: (int) X{
    int i = 0, r = 0, temp = 0;
    NSString *newGene = @"";
    
    // Да будет колода карт.
    // На каждой карте нанесен номер - место в геноме, где может случиться мутация.
    // Таких карт столько, сколько мест в геноме.
    int *mutationPlaces = (int*) malloc(self.genomeLength * sizeof(int));
    
    for(i = 0; i < self.genomeLength; i++){
        mutationPlaces[i] = i;
    }

    // И да перетасуем нашу колоду!
    // Пусть i = 0; Берем сучайный элемент из отрезка [i..genomeLength-1]
    // и меняем местами с i-тым элементом. i++. Повторить.
    for (i = 0; i < X; ++i) {
        r = arc4random()%(self.genomeLength-i)+i;
        
        temp = mutationPlaces[i];
        mutationPlaces[i] = mutationPlaces[r];
        mutationPlaces[r] = temp;
    }

    // Рассматривая часть колоды [0..X], производим мутации
    for (i = 0; i < X; ++i) {
        newGene = [@"ATGС" substringWithRange: NSMakeRange(arc4random()%4, 1)];
        while (newGene == [self.DNA objectAtIndex: mutationPlaces[i]]) {
            newGene = [@"ATGС" substringWithRange: NSMakeRange(arc4random()%4, 1)];
        }
        [self.DNA replaceObjectAtIndex: mutationPlaces[i] withObject:newGene];
    }

}

@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Объявляем и инициализируем клетку. Можно делать [.... init], тогда длина будет 100.
        // [.... initWithGenomeLength: N] позволяет установить произвольную длину.
        Cell *cell1;
        cell1 = [[Cell alloc] initWithGenomeLength:100];
        
        Cell *cell2;
        cell2 = [[Cell alloc] initWithGenomeLength:100];
        
        // Сравниваем геном и выводим кол-во отличий
        NSLog(@"dist = %d",[cell1 hammingDistance:cell2]);
        // [.... show] выводит весь геном на экран (много (именно: genomeLength) букаф)
//        [cell1 show];
//        [cell2 show];

        // Мутируем обе клетки на i
        int i = 5;
        [cell1 mutate:i];
        [cell2 mutate:i];
        
        // И снова выводим кол-во отличий
        NSLog(@"dist = %d",[cell1 hammingDistance:cell2]);
//        [cell1 show];
//        [cell2 show];

        
    }
    return 0;
}


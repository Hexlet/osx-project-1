//
//  main.m
//  DNA
//
//  Created by IBEC IBEC on 10/31/12.
//  Copyright (c) 2012 IBEC IBEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

#define MUTATING_1 50   // Процентное кол-во мутируемых элементов первого массива
#define MUTATING_2 60   // Процентное кол-во мутируемых элементов второго массива

@interface Cell (mutator)

- (void)mutate:(int)changePercent;

@end

@implementation Cell (mutator)

- (void)mutate:(int)changePercent
{
    if (changePercent >= 0 && changePercent <=100)
    {
        int elementsToChange = (int)(self.DNALength * changePercent)/100; // Сколько элементов массива заменить
        NSMutableSet *changedValue = [[NSMutableSet alloc] init]; // Какие элементы уже были заменены
         // номер замененного элемента массива
        int i = 0;
        while (i < elementsToChange)
        {
            NSNumber *toChange = [[NSNumber alloc] initWithInt:arc4random()%[self.DNA count]];
            if (![changedValue containsObject:toChange]) // Заменяли ли этот элемент
            {
                i++;
                [changedValue addObject:toChange]; // Добавить, что элемент изменен
                NSString *newElement = [[NSString alloc] init]; // Новый элемент
                do
                {
                    newElement = [self.DNAs objectAtIndex:arc4random()%[self.DNAs count]]; // Сгенерировать новый элемент
                } while (newElement == [self.DNA objectAtIndex:[toChange intValue]]); // Если равен предыдущему, то сгенерировать новое значение
                //NSLog(@"Changing: %@ (%@ -> %@)", toChange, [self.DNA objectAtIndex:[toChange intValue]], newElement);
                [self.DNA replaceObjectAtIndex:[toChange intValue] withObject:newElement]; // Заменить на новый элемент
            }
        }
        
    }
    else
    {
        NSLog(@"Error! Incorrect value for changePercent");
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        [cell1 printDNA];
        [cell2 printDNA];
        NSLog(@"Hamming distance before mutating: %d", [cell1 hammingDistance:cell2]);
        
        // Мутация
        
        [cell1 mutate:MUTATING_1]; // изменить 50% элементов
        [cell1 printDNA];
        [cell2 mutate:MUTATING_2]; // изменить 60% элементов
        [cell2 printDNA];
        NSLog(@"Hamming distance after mutating: %d", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


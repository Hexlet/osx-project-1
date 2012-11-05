//
//  main.m
//  Human DNA[
//
//  Created by Dmitry Marenich on 11/4/12.
//  Copyright (c) 2012 Dmitry Marenich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

// Создаем категорию класса Cell
@interface Cell (mutator)
-(void) mutate:(int)diffOfDNA;
@end

// Создаем имплиментацию категории 'mutator' класса 'Cell'
@implementation Cell (mutator)
-(void) mutate:(int)diffOfDNA {
    // Эту часть кода я позаимствовал? разобравшись в логике
    NSMutableArray *mutatedPositionDNA = [[NSMutableArray alloc] initWithCapacity:diffOfDNA];
    for (int i = 0; i < diffOfDNA; ++i) {
            int positionDNA = 0;
            do {
                positionDNA = arc4random()%100;
            }
            while ([mutatedPositionDNA containsObject:[NSNumber numberWithInt:positionDNA]]);
            NSString *generator = [[self DNA] objectAtIndex:positionDNA];
            NSString *mutatedDNA = nil;
        do {
            mutatedDNA = [[self arrayOfChars] objectAtIndex:arc4random()%4];
        }
        while ([mutatedDNA isEqualToString:generator]);
        [[self DNA] replaceObjectAtIndex:positionDNA withObject:mutatedDNA];
        [mutatedPositionDNA addObject:[NSNumber numberWithInt:positionDNA]];
    }
}
@end


int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // создаем два объекта класса Cell
        Cell *cellA = [[Cell alloc] init];
        Cell *cellB = [[Cell alloc] init];
        
        // Выводим значение Хэмминга перед мутацией
        NSLog(@"Hamming distance before mutation = %i", [cellA hammingDistance:cellB]);
        // Производим мутацию объектов на заданные значения
        [cellA mutate:17];
        [cellB mutate:55];
        // Выводим значение Хэмминга после мутации
        NSLog(@"Hamming distance after mutation complete = %i", [cellA hammingDistance:cellB]);
    }
    return 0;
}


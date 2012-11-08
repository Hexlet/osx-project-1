//
//  main.m
//  HomeWorkOne_DNA
//
//  Created by Anatoly Yashkin on 07.11.12.
//  Copyright (c) 2012 Anatoly Yashkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ScreenSaver/ScreenSaver.h>
#import "Cell.h"

@interface Cell(mutator)
-(void)mutate:(int)X;
@end

@implementation Cell(mutator)

-(void)mutate:(int)X
{
    NSCAssert((X>0&&X<=100), @"Must be 0<X<=100"); //дабы никто не смог изменить 146% от нашей ДНК, будем генерировать эксепшн, если передаются неправильные значения
    
    if (X) {
        NSMutableArray *indexes = [[NSMutableArray alloc] initWithCapacity:100]; // Массив для индексов
        NSUInteger randomKey = 0;
        
        //заполним массив индексов, в последовательностях ДНК у нас по заданию 100 символов,
        //так что не буду вводить отдельную переменную для этого
        for (int i=0; i<100; i++) {
            [indexes addObject:[NSNumber numberWithInt:i]];
        }
        for (int modified=0;modified<X;modified++) {
            NSUInteger indexToModify = [[indexes objectAtIndex:randomKey] integerValue]; // запоминаем индекс
            [self.DNA replaceObjectAtIndex:indexToModify withObject:[[self class] getRandomDNAPart:[self.DNA objectAtIndex:indexToModify]]];//меняем символ любым другим
            [indexes removeObjectAtIndex:randomKey];//удаляем уже использованный индекс.
        }
    }

    
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"cell1: %@", cell1);
        NSLog(@"cell2: %@", cell2);
        NSLog(@"Humming distance: %d", [cell1 hammingDistance:cell2]);
        [cell1 mutate:100];
        [cell2 mutate:100];
        NSLog(@"mutated cell1: %@", cell1);
        NSLog(@"mutated cell2: %@", cell2);
        NSLog(@"Humming distance after mutation: %d", [cell1 hammingDistance:cell2]);
        
    }
    return 0;
}


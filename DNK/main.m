//
//  main.m
//  DNK
//
//  Created by Andrew Krylov on 31.10.12.
//  Copyright (c) 2012 Andrew Krylov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void) mutator: (int) mutatePercentage;

@end

@implementation Cell (mutator)

-(void) mutator: (int) mutatePercentage {
    
    // Если процент для мутации больше 100 или меньше 0 сделаем его 100 и 0 соответственно
    mutatePercentage = (mutatePercentage>100)?(100):((mutatePercentage<0)?(0):mutatePercentage);
    
    // Здесь будем хранить уже измененные индексы
    NSMutableArray *updated = [[NSMutableArray alloc] init];
    
    for (int i=0; i<mutatePercentage; i++) {

        // Поиск индекса, который еще не использвался
        int index = 0;
        do {
            index = arc4random() % 100;
        }
        while ([updated containsObject:[NSNumber numberWithInt:index]]);
        
        NSArray *validDnkSet = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        NSString *curentValue = [[self dnk] objectAtIndex:index];
        NSString *newValue;
        //Если новое и старое значение равны, то попробуем выбрать следующее новое
        do {
            newValue = [validDnkSet objectAtIndex: arc4random() % [validDnkSet count]];
        } while ([curentValue isEqualToString:newValue]);
        
        //Заменим значение на новое
        [[self dnk] replaceObjectAtIndex:index withObject:newValue];

        //Сохраним индекс как использованный
        [updated addObject:[NSNumber numberWithInt:index]];

    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
 
        Cell *myCell, *myCell1;
        
        //Инициализируем наши ДНК
        myCell  = [[Cell alloc] init];
        myCell1 = [[Cell alloc] init];
        
        
        // Выведем полученные результаты
        // NSLog(@"myCell \n%@", [myCell debugDescription]);
        // NSLog(@"myCell1 \n%@", [myCell1 debugDescription]);

        //Сравним ДНК myCell и myCell1
        NSLog(@"Hamming distance = %i",[myCell hammingDistance:myCell1]);

        [myCell mutator:30];
        [myCell1 mutator:40];
        NSLog(@"New Hamming distance after mutation = %i",[myCell hammingDistance:myCell1]);

    }
    
    return 0;
}


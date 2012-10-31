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
    
    // Если процент для мутации больше 100 сделаем его 100
    if (mutatePercentage>100)
        mutatePercentage = 100;
    
    // Здесь будем хранить уже измененные индексы
    NSMutableArray *updated = [[NSMutableArray alloc] init];
    
    for (int i=0; i<mutatePercentage; i++) {

        int index = arc4random() % 100;
       
        // Поиск индекса, который еще не использвался
        while ([updated containsObject:[NSNumber numberWithInt:index]]) {
            index = arc4random() % 100;
        }
        
        //Сохраним индекс как использованный
        [updated addObject:[NSNumber numberWithInt:index]];

        NSArray *validDnkSet = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        NSString *curentValue = [[self dnk] objectAtIndex:index];
        NSString *newValue = [validDnkSet objectAtIndex: arc4random() % [validDnkSet count]];
        
        //Если новое и старое значение равны, то попробуем выбрать следующее новое
        while ([curentValue isEqualToString:newValue]) {
            newValue = [validDnkSet objectAtIndex: arc4random() % [validDnkSet count]];
        }
        
        //Заменим значение на новое
        [[self dnk] replaceObjectAtIndex:index withObject:newValue];

    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
 
        Cell *myCell, *myCell1, *myCell2;
        
        //Инициализируем наши ДНК
        myCell  = [[Cell alloc] init];
        myCell1 = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        
        //Выведем полученные результаты
        NSLog(@"myCell \n%@", [myCell debugDescription]);
        NSLog(@"myCell1 \n%@", [myCell1 debugDescription]);

        //Сравним ДНК myCell и myCell1
        NSLog(@"Hamming distance = %i",[myCell hammingDistance:myCell1]);
        
        //Сохраним ДНК myCell1 до мутации в myCell2
        [myCell2 setDnk:[[myCell1 dnk] copy]];
        
        [myCell1 mutator:100];

        //Выведем значиние ДНК myCell1 до и после мутации и сравним их 
        NSLog(@"myCell1 before mutation \n%@", [myCell2 debugDescription]);
        NSLog(@"MyCell1 after mutation \n%@", [myCell1 debugDescription]);
        NSLog(@"Hamming distance before mutation = %i",[myCell1 hammingDistance:myCell2]);
    }
    
    return 0;
}


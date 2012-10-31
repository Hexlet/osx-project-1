//
//  Cell+Mutator.m
//  DNA
//
//  Created by Администратор on 11/1/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)
-(void)mutate: (int) x {
    // начальные проверки для входных данных
    if (x > 100) x = 100;
    if (x < 0) NSLog(@"Inccorect percent for mutation");
    else { // процесс мутации
        int shot, count = DNA_CAPACITY * x / 100; // высчитываем количество клеток для мутации в общем случае (когда DNA_CAPACITY != 100)
        NSString *s;
        
        // выбираем случайно Х% клеток, заменяем их значение на lowercase (для сохранения буквы, что бы при замене знать на что менять не надо)
        for (int i = 0; i < count; i++) {            
            do {
                shot = arc4random() % DNA_CAPACITY;
                s = [self.DNA objectAtIndex: shot];
            } while (islower([s characterAtIndex: 0]));
            [self.DNA setObject:[s lowercaseString] atIndexedSubscript: shot];
        }
        
        // мутируем все клетки с lowercase        
        for (int i = 0; i < DNA_CAPACITY; i++)
            if (islower([[self.DNA objectAtIndex: i] characterAtIndex: 0])) {
                do {
                    s = [self generateRandomNucletoid];
                } while ([s isEqual: [[self.DNA objectAtIndex: i] uppercaseString]]);
                [self.DNA setObject: s atIndexedSubscript: i];
            }
    }
}
@end
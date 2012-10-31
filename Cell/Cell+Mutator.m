//
//  Cell+Mutator.m
//  Cell
//
//  Created by padawan on 31.10.12.
//  Copyright (c) 2012 padawan. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)
- (void) mutate:(int)percent {
    NSLog(@"=====================");
    // Количество элементов для замены
    int itemsForReplace = percent * [self lengthOfDna] / 100;
    NSLog(@"Будет мутировать нуклеотидов %iшт(%i%%)", itemsForReplace, percent);
    
    // Массив индексов для DNA.
    // Каждый индекс указывает на один нуклеотид в DNA
    NSMutableArray *ind = [[NSMutableArray alloc] initWithCapacity:[self lengthOfDna]];
    
    // Создаем индексы
    for (int i = 0; i < [self lengthOfDna]; i++) {
        [ind addObject: [NSNumber numberWithInt:i]];
    }
    
    // Отступ от начала массива
    int offset = 0;
    
    for (int i = 0; i < itemsForReplace; i++) {
        // какой элемент от начала нужно взять
        offset = arc4random()%ind.count;
        
        // Номер нуклеотида в DNA
        int replacement = [[ind objectAtIndex:offset] intValue];
        NSLog(@"Мутирует %i-й нуклеотид", replacement);
        
        // Заменяем нуклеотид
        [self replace: replacement];
        
        // Удаляем индекс, тем самым обеспечиваем уникальность выбранного нуклеотида.
        [ind removeObjectAtIndex:offset];
    }
}

- (void) replace: (int)index {
    // Старый
    NSString *currentNucleotid = [[self DNA] objectAtIndex:index];
    // Новый
    NSString *newNucleotid;
    
    // Замена
    // Пока новый равен старому
    do {
        newNucleotid = [[self nucleotides] objectAtIndex:arc4random()%[[self nucleotides] count]];
    } while (newNucleotid == currentNucleotid);
    
    [[self DNA] replaceObjectAtIndex:index withObject:newNucleotid];
    
    // Проверка замены
    NSLog(@"%@ => %@", currentNucleotid, newNucleotid);
}
@end

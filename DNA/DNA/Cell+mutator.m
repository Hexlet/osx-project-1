//
//  Cell+mutator.m
//  DNA
//
//  Created by Mac on 02.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)


- (void)shuffle:(NSMutableArray*) array {
    NSUInteger count = [array count];
    for (NSUInteger i = 0; i < count; i++) {
        // Выбираем произвольный элемент между i и концом массива, и меняем их местами
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [array exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}


-(void) mutate:(int)percent {
    if (percent <=0 || percent > 100)
        return;
    
    // вычисляем количество ячеек которые нужно изменить в массиве dna
    int numberOfMutatedCells = SIZE * percent / 100;
    
    // создаем массив который будет сопадать размером с dna и содержать номера элементов по порядку
    NSMutableArray* shuffledArray = [[NSMutableArray alloc] init];
    for (int i = 0; i<SIZE; i++){
        [shuffledArray addObject:[NSNumber numberWithInt:i]];
    }
    
    // перемешиваем содержимое массива
    [self shuffle:shuffledArray];
    
    for (int i = 0; i<numberOfMutatedCells; i++) {
        // создаем множество символов нуклеотид
        NSMutableSet *set = [NSMutableSet setWithObjects:@"A", @"T", @"G", @"C",nil];
        
        // из массива shuffledArray получаем индекс элемета который будем менять в массиве dna
        NSUInteger indexInDna = [[shuffledArray objectAtIndex:i] unsignedIntegerValue];
        
        // удаляем из множества текущий символ
        NSString *c = [dna objectAtIndex:indexInDna];
        [set removeObject:c];
        
        //заменяем текущий символ в массиве dna на случайный из оставшихся в множестве
        int rnd = arc4random() % (int)[set count];
        NSArray *arraySet = [set allObjects];
        [dna replaceObjectAtIndex:indexInDna withObject:[arraySet objectAtIndex:rnd]]; 
    }
}

@end

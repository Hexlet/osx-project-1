//
//  Cell+mutator.m
//  DNA
//
//  Created by Mac on 02.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

- (void)shuffle:(NSMutableArray*) array
{
    NSUInteger count = [array count];
    for (NSUInteger i = 0; i < count; i++) {
        // Select a random element between i and end of array to swap with.
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [array exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

-(void) mutate:(int)percent {
    // вычисляем количество ячеек которые нужно изменить в массиве dna
    int numberOfMutatedCells = SIZE * percent / 100;
    
    // создаем массив который будет сопадать размером с dna и содержать номера элементов по порядку
    NSMutableArray* shuffledArray = [NSMutableArray arrayWithCapacity:SIZE];
    for (int i = 0; i<SIZE; i++){
        NSNumber *num = [NSNumber numberWithInt:i];
        [shuffledArray insertObject:num atIndex:i];
        
    }
    // перемешиваем содержимое массива
    [self shuffle:shuffledArray];
    
    // массив arrayMask содержит номера элементов массива dna которые необходимо изменить
    NSArray* arMask = [shuffledArray subarrayWithRange: NSMakeRange(1, numberOfMutatedCells)];
    
    for (int i = 0; i<numberOfMutatedCells; i++) {
        // создаем множество символов нуклеотид
        NSMutableSet *set = [NSMutableSet setWithObjects:@"A", @"T", @"G", @"C",nil];
        
        // из массива arMask получаем индекс элемета который будем менять в массиве dna
        NSUInteger index = [[arMask objectAtIndex:i] unsignedIntegerValue];
        
        // удаляем из множества текущий символ
        NSString *c = [dna objectAtIndex:index];
        [set removeObject:c];
        
        //заменяем текущий символ в массиве dna на случайный из оставшихся в множестве
        int rnd = arc4random() % (int)[set count];
        NSArray *arraySet = [set allObjects];
        [dna replaceObjectAtIndex:index withObject:[arraySet objectAtIndex:rnd]]; //[set anyObject]
    }
}

@end

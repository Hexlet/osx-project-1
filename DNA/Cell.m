//
//  Cell.m
//  dna
//
//  Created by Алексей on 12.11.12.
//  Copyright (c) 2012 Алексей. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    if(self) {
        _dna = [NSMutableArray arrayWithCapacity:100];
        for(int i=0; i<100; i++) {
            int rndGenerator;
            rndGenerator = arc4random() %4;
            if (rndGenerator == 0) {
                [_dna addObject:@"A"];
            } else if (rndGenerator == 1) {
                [_dna addObject:@"T"];
            } else if (rndGenerator == 2) {
                [_dna addObject:@"G"];
            } else if (rndGenerator == 3) {
                [_dna addObject:@"C"];
            }
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)cell {
    _counter = [[self dna] count];
    int iter = 0;
    for(int i=0; i<_counter; i++) {
            if ([[self dna] objectAtIndex:i] != [[cell dna] objectAtIndex:i])
                iter++;
    }
    
    return iter;
}


-(id)copyWithZone:(NSZone *)zone

{
    
    Cell *another = [[Cell alloc] init];
    
    another.dna = [[self dna] copyWithZone: zone];
    
    return another;
    
}

@end

@implementation Cell(mutator)

//Метод mutate не дописан, подключился к проекту только сегодня(
-(void) mutate:(int)perc {
    //Подсчитываем количество мутирующих элементов массива
    perc = perc * [[self dna] count] / 100;
    
    //Иницилизируем массив индексов
    unsigned index[[[self dna] count]];
    for (int i = 0; i < [[self dna] count] - 1; i++)
        index[i] = i;
    
    //Заменяем элементы мутирующего массива
    for(int i = 0; i < perc; i++) {
        [[self dna] objectAtIndex:(index[arc4random() % [[self dna] count]])];
        
    }

}

@end

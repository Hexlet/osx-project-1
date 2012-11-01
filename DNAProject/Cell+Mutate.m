//
//  Cell+Mutate.m
//  DNAProject
//
//  Created by Denys Volokh on 1/11/12.
//  Copyright (c) 2012 Denys Volokh. All rights reserved.
//

#import "Cell+Mutate.h"
#import "Cell.h"

@implementation Cell (Mutate)

- (void) mutate:(int)percent
{
    //Длина цепочки DNA
    int dnaLength = (int)[DNA count];
    
    //Вычисляем сколько символов будем менять
    int howManyToChange = ceil((float)dnaLength * (float)percent / 100);
    
    //Хранилище индексов которые мы поменяли
    NSMutableArray *changedIndeces = [[NSMutableArray alloc] initWithCapacity:howManyToChange];
    
    //Пока есть что менять - меняет
    while (howManyToChange > 0) {
        //Индекс элемента которые будем менять и проверяем не меняли его раньше, если меняли - генерим еще раз индекс
        int randomIndex = arc4random() % dnaLength;
        while ([changedIndeces indexOfObject:[NSNumber numberWithInt:randomIndex]] != NSNotFound) {
            randomIndex = arc4random() % dnaLength;
        }
        
        [DNA setObject:[self generateChar] atIndexedSubscript:randomIndex];
        [changedIndeces addObject:[NSNumber numberWithInt:randomIndex]];
        howManyToChange--;
    }
}

@end

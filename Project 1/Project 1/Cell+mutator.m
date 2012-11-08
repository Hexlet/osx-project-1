//
//  Cell+mutator.m
//  Project 1
//
//  Created by Администратор on 11/5/12.
//  Copyright (c) 2012 hexlet. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
-(void)mutate:(int)percent
{
    
    if (percent<1) {
        return;
    }
    else if(percent>100)
    {
        percent=100;
    }
    
    //Сколько элементов днк мутировать
    int mutateArrayLength=floor(DNAArrayLength*percent/100);
    
    //Промежуточный массив с индексами всего массива днк
    NSMutableArray *arr1=[NSMutableArray arrayWithCapacity:DNAArrayLength];
    for (int i=0; i<DNAArrayLength; i++) {
        [arr1 addObject:[NSNumber numberWithInt:i]];
    }
    
    //Перемешивание индексов
    for (int i=0; i<DNAArrayLength; i++) {
        int j=i+arc4random()%(DNAArrayLength-i);
        [arr1 exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    
    
    for (int i=0; i<mutateArrayLength; i++) {
        //копирование массива возможных элементов днк во временный массив
        NSMutableArray *tmpArray=[NSMutableArray arrayWithArray:DNACharArray ];
        //удаление из временного массива элемента, чтобы не обновлять массив днк на такое же значение
        [tmpArray removeObject:DNA[i]];
        //обновление элемента ДНК
        DNA[i]=tmpArray[arc4random()%([tmpArray count])];
        
    }

}


@end

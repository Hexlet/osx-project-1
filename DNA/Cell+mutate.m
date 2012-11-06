//
//  Cell+mutate.m
//  DNA
//
//  Created by Evgeniy Kozachenko on 06.11.12.
//  Copyright (c) 2012 Evgeniy Kozachenko. All rights reserved.
//

#import "Cell+mutate.h"

@implementation Cell (mutate)
-(void) mutate:(int)percent{
    NSArray *tmp=[[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
    //множество возможных значений
    NSMutableArray *keys=[[NSMutableArray alloc] init];
    //множество ключей ДНК, для проверки, какие еще не мутировали
    int count=round(percent*self->DNA.count/100);
    //подсчет количества мутаций (если ДНК длиннее 100)
    for(int i=0;i<count;i++){
        [keys addObject:[NSNumber numberWithInt:i]];
    }
    //заполняем массив ключей индексами
    
    while(count>0)//пока не митировали все гены
    {
        int k=rand()%keys.count;
        //выбираем случайный индекс из множества возможных ключей
        NSInteger g=[[keys objectAtIndex:k] integerValue];
        //получаем индекс гена по указанному ключу
        NSString *oldVal=[self->DNA objectAtIndex:g];
        //берем старое значение гена
        NSString *newVal=[tmp objectAtIndex:rand()%4];
        //создаем новое
        while (oldVal==newVal) {
            newVal=[tmp objectAtIndex:rand()%4];
            //если новое такое же как и старое, то создаем новое до тех пока они не станут отличаться
        }
        [self->DNA replaceObjectAtIndex:g withObject: newVal];
        //заменяем ген новым значением в нужном индексе гена
        [keys removeObjectAtIndex:k];
        //удаляем этот индекс из множеста возможных
        count--;
        //уменьшаем количество нужных мутаций
    }
    //шаг мутации (чтобы каждый раз новый ген мутировать)
}
@end

//
//  Cell.m
//  DNA
//
//  Created by Evgeniy Kozachenko on 04.11.12.
//  Copyright (c) 2012 Evgeniy Kozachenko. All rights reserved.
//

#import "Cell.h"
#import <stdlib.h>

@implementation Cell

-(id)init{
    self=[super init];
    //вызываем инициализацию родителя
    NSArray *tmp=[[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
    //множество возможных значений генов
    DNA=[[NSMutableArray alloc] init];
    //инициализируем динамический массив
    for(int i=0;i<100;i++){
        [DNA addObject:[tmp objectAtIndex:rand()%4]];
        //заполняем ДНК 100-ми случайными генами из вожмножного множества
    }
    return self;
}
-(int) hammingDistance: (Cell*) d{
    int count=0;
    //зануляем показатель
    for(int i=0;i<100;i++){
        if([DNA objectAtIndex:i]!=[d->DNA objectAtIndex:i])
            count++;
            //если ген в классе self отличается от того же гена в классе, переданном в параметре, то увеличиваем значение показатель
    }
    return count;
    //возвращаем показатель
}
@end

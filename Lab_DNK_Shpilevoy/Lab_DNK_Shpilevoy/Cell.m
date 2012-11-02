//
//  Cell.m
//  Lab_DNK_Shpilevoy
//
//  Created by Stanislav Shpilevoy on 01.11.12.
//  Copyright (c) 2012 Stanislav Shpilevoy. All rights reserved.
//

#import "Cell.h"

@implementation Cell 

@synthesize DNA;
-(id)init
{
    self = [super init];
    array = [NSSet setWithObjects : @"C",@"T",@"G",@"A", nil];  // заполняем множество элементов буквами
    DNA = [NSMutableArray arrayWithCapacity:100]; // создаем массив с определенным количеством элементов
        for (int i=0; i<=100; i++)
        {
            [DNA addObject:[[array allObjects] objectAtIndex:arc4random()%[array count]]]; // заполняем массив рандомными буквами
        }
    return self;
}
-(int)hammingDistance:(Cell*)inputCell
{
    int result=0;
    if ([[inputCell DNA] count]!=[[self DNA] count]) // сравниваем позиции в двух разных ДНК
    {
        NSLog(@"Различные ДНК");
    }
    else
    {
        for (id symbol in [inputCell DNA])
        {
            NSUInteger i=[[inputCell DNA] indexOfObject:symbol];
            if (![symbol isEqual:[[self DNA] objectAtIndex:i]])
            {
                result++;
            }
        }
    }
    
    return result;
}
@end

@implementation Cell (Mutator)

-(void)mutate:(int)p
{
    
    NSMutableArray* arrWithIndexes = [[NSMutableArray alloc] init];
    for (int i=0; i< [DNA count];i++)
    {
        [arrWithIndexes addObject:[NSString stringWithFormat:@"%d",i]]; // набор чисел
    }
    
    for (int i=1; i<=p;i++)
    {
        int index = arc4random()% [arrWithIndexes count];
        int value = [[arrWithIndexes objectAtIndex:index] intValue];    // извлекаем рандом число по индексам
        [arrWithIndexes removeObjectAtIndex:index]; //тот номер, что уже поменяли, не трогаем
        [DNA replaceObjectAtIndex:value withObject:[[array allObjects] objectAtIndex:arc4random()%[array count]]]; // заменяем символы
    }
}
@end

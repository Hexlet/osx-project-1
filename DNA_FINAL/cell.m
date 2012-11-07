//
//  Cell.m
//  DNA
//
//  Created by Пользователь Пользователь on 03.11.12.
//  Copyright (c) 2012 Работа. All rights reserved.
//

#import "cell.h"


@implementation Cell
@synthesize DNA;

//инициализация созданного объекта нашими данными
-(id) init {
    self = [super init];
    if (self) {
        //создадим множество со всеми видами элементов ДНК
        
        set = [[NSSet alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
        //инициализируем массив нужной длины
        DNA = [[NSMutableArray alloc] initWithCapacity:DNA_LENGTH];
        
        //заполняем его случайными значениями
        for (int i=0;i<DNA_LENGTH;i++) 
            [DNA addObject:[[set allObjects] objectAtIndex:arc4random()%4]];
        
    }
    return self;
}


//Метод вычисляющий различия ДНК
-(int)hammingDistance:(Cell *)DNA2 {
    int distance = 0;
    for (int i=0; i<DNA_LENGTH;i++){
    if ([[self DNA] objectAtIndex:i]!=[[DNA2 DNA] objectAtIndex:i]) distance++;
    }
    return distance;
}

//Метод для вывода последовательности ДНК для контроля
-(void)print 
{
    NSString *str;
    str = [[NSString alloc] init];
    [str autorelease]; //освобождаем память позже
    for (int i=0;i<DNA.count;i++)
    str = [str stringByAppendingString:[DNA objectAtIndex:i]];
    NSLog(@"%@",str);

}

@end

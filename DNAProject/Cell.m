//
//  Cell.m
//  DNAProject
//
//  Created by S.Lebedev on 30.10.12.
//  Copyright (c) 2012 S.Lebedev. All rights reserved.
//

#import "Cell.h"

const NSString *gene[capacityOfGene] = {@"A",@"T",@"G",@"C"};

@implementation Cell

-(id)init // переписываем метод для нашего класса, т.к. необходима инициализация собственных переменных
{
    self = [super init]; // сам объект обязан проинициализироваться методом родителя
    if (self) {
        DNA = [[NSMutableArray alloc] initWithCapacity:capacityOfDNA]; // готовим массив для ДНК
        NSUInteger generated; // для сгенерированного индекса нужной буквы
        for (int i=0; i<capacityOfDNA; i++) {
            generated = arc4random() % capacityOfGene;
            [DNA addObject:gene[generated]];
        }
    }
    return self;
}

-(NSString *)description //этот метод позволит выводить ДНК в виде NSLog(@"%@",myCell)
{
    return [DNA componentsJoinedByString:@""];
}

-(int)hammingDistance:(Cell *)someCell {
    int ham = 0;
    /* долго думал, и пришёл к выводу, что так сравнивать лучше всего, так как 
     у нас нет прямого доступа к массиву DNA объекта someCell, а давать доступ 
     к модификации последовательности "вручную" я не хочу. Если сделать 
     @property (nonatomic,readonly), то метод в категории не сможет ничего сделать
     с моей последовательностью ДНК */
    NSString *sourceString = [[NSString alloc] initWithString:[self description]];
    NSString *compareString = [[NSString alloc] initWithString:[someCell description]];
    for (int i=0; i<capacityOfDNA; i++) {
        if ([sourceString characterAtIndex:i]!=[compareString characterAtIndex:i]) ham++;
    }
    return ham;
}

@end

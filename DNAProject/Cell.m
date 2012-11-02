//
//  Cell.m
//  DNAProject
//
//  Created by S.Lebedev on 30.10.12.
//  Copyright (c) 2012 S.Lebedev. All rights reserved.
//

#import "Cell.h"


@implementation Cell

@synthesize DNA; // мне необходимо _обязательно_ синтезировать свою переменную, не полагаясь на автоматику моей версии Xcode. Иначе свойство и переменная будут жить отдельно друг от друга

-(id)init // переписываем метод для нашего класса, т.к. необходима инициализация собственных переменных
{
    self = [super init]; // сам объект обязан проинициализироваться методом родителя
    if (self) {
        DNA = [[NSMutableArray alloc] initWithCapacity:capacityOfDNA]; // готовим массив для ДНК
        for (int i=0; i<capacityOfDNA; i++) {
            [DNA addObject:[self getRandomGene]];
        }
    }
    return self;
}

/* Следующий метод нужен для того, чтобы можно было заполнять
 ДНК "статическими" объектами, которые не поменяешь. Таким образом,
 каждая созданная последовательность ДНК будет состоять из указателей
 на один из четырёх статических символов в памяти. */
-(NSString *)getRandomGene{
    static NSString *gene[capacityOfGene]={@"A",@"T",@"G",@"C"};
    return gene[arc4random()%capacityOfGene];
}

-(NSString *)description //этот метод позволит выводить ДНК в виде NSLog(@"%@",myCell)
{
    return [DNA componentsJoinedByString:@""];
}

-(int)hammingDistance:(Cell *)someCell {
    int ham = 0;
    for (int i=0; i<capacityOfDNA; i++) {
        if ([[DNA objectAtIndex:i] isNotEqualTo:[[someCell DNA] objectAtIndex:i]]) ham++;
    }
    return ham;
}

@end

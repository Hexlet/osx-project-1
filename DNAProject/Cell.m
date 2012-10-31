//
//  Cell.m
//  DNAProject
//
//  Created by S.Lebedev on 30.10.12.
//  Copyright (c) 2012 S.Lebedev. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init // переписываем метод для нашего класса, т.к. необходима инициализация собственных переменных
{
    self = [super init]; // сам объект обязан проинициализироваться методом родителя
    if (self) {
        capacityOfDNA = 100; // по условию, последовательность из 100 символов
        DNA = [[NSMutableArray alloc] initWithCapacity:capacityOfDNA]; // необязательно, но по условию в массиве должно быть 100 символов
        gene = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil]; // каждый элемент последовательности может быть любым из 4 символов: A, T, G или C
        //srandom(time(0));
        NSUInteger generated; // для сгенерированного индекса нужной буквы
        for (int i=0; i<capacityOfDNA; i++) {
            generated = arc4random() % [gene count];
            [DNA addObject:[gene objectAtIndex:generated]];
        }
    }
    return self;
}

-(NSString *)description //этот метод позволит выводить ДНК в виде NSLog(@"%@",myCell)
{
    NSString *descr = [[NSString alloc] init]; // хочу, чтобы всё выводилось в одну строку!
    for (id elem in DNA) {
        descr = [descr stringByAppendingString:elem];
    }
    return descr;
}

-(int)hammingDistance:(Cell *)someCell {
    int ham = 0;
    /* долго думал, и пришёл к выводу, что так сравнивать лучше всего, так как 
     у нас нет прямого доступа к массиву DNA объекта someCell */
    NSString *sourceString = [[NSString alloc] initWithString:[self description]];
    NSString *compareString = [[NSString alloc] initWithString:[someCell description]];
    for (int i=0; i<capacityOfDNA; i++) {
        if ([sourceString characterAtIndex:i]!=[compareString characterAtIndex:i]) ham++;
    }
    return ham;
}

@end

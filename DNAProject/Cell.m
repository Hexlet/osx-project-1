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
            [DNA addObject:[[self class] getRandomGene:nil]];
        }
    }
    return self;
}

/* Следующий метод нужен для того, чтобы можно было заполнять
 ДНК "статическими" объектами, которые не поменяешь. Таким образом,
 каждая созданная последовательность ДНК будет состоять из указателей
 на один из четырёх статических символов в памяти. */
/* Сделал метод более универсальным. Теперь метод не только может
 возвратить какой-нибудь случайный из 4-х генов (в случае, когда передаваемый
 параметр nil), но и позволяет выдать ген на замену, что упрощает алгоритм
 мутации. */
+(NSString *)getRandomGene:(id)replacingGene{
    static NSArray *gene = nil;
    if (!gene) {
        gene = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil];
    }
    if (replacingGene && [gene containsObject:replacingGene]) {
#ifdef debug // директиву, в случае надобности, можно включить в Cell.h
        id tmp = gene[([gene indexOfObject:replacingGene]+1+arc4random_uniform([gene count]-1))%[gene count]];
        NSLog(@"%@ replacing with %@",replacingGene,tmp);
        return tmp;
#else
        /* для замены воспользуемся хитрой конструкцией, суть её в том, что из-за смещения на indexOfObject
         получится любое другое значение, но не исходное. Допустим, на вход поступил replacingGene=@"T",
         его индекс 1. Формирование нового индекса произойдёт по формуле:
         (1+1+{0,1,2})%4
         Несложно предсказать, что в зависимости от рандома (виберется 0, 1 или 2),
         значение нового индекса будет 2, 3 или 0! */
        return gene[([gene indexOfObject:replacingGene]+1+arc4random_uniform([gene count]-1))%[gene count]];
#endif
    }
    else {
        return gene[arc4random_uniform([gene count])];
    }
}

/* Обратите внимание на этот метод - он мне помогает не создавать лишнюю копию
 DNA у обекта someCell метода hammingDistance*/
-(id)geneAtIndex:(NSUInteger)index {
    return DNA[index]; // работаем с private NSMutableArray *DNA
}

-(NSString *)description //этот метод позволит выводить ДНК в виде NSLog(@"%@",myCell)
{
    return [DNA componentsJoinedByString:@""];
}

-(int)hammingDistance:(Cell *)someCell {
    int ham = 0;
    for (int i=0; i<capacityOfDNA; i++) {
        if ([[DNA objectAtIndex:i] isNotEqualTo:[someCell geneAtIndex:i]]) ham++;
    }
    return ham;
}

// мне необходимо переопределить геттер, иначе он всё равно будет выдавать NSMutableArray, что мне не нужно
-(NSArray *)DNA {
    return (NSArray *)[DNA copy];
}

@end

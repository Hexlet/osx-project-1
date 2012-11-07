//
//  Mutator.m
//  DNK
//
//  Created by p.naumov on 05.11.12.
//  Copyright (c) 2012 p.naumov. All rights reserved.
//

#import "Mutator.h"

@implementation Cell (Mutator)


-(void)mutate:(int)percent {
    
    if (percent < 0 && percent > 100)
    {
        NSLog(@"Error 0 to 100");
        return;
    }
    
    NSUInteger mutateGenesCount = [self . DNA count] *percent / 100;
    NSMutableArray *mutateGenes = [NSMutableArray arrayWithCapacity:mutateGenesCount];
    
    for (NSUInteger i = 0;  i < mutateGenesCount; i++) {
        NSNumber *index;
        //выбираем случайные позииции 
        do {
            index = [NSNumber numberWithInt:arc4random() % [self . DNA count]]; //генерируем новый индекс
        } while ([mutateGenes containsObject:index]); //если mutateGenes уже лежит этот индекс то перегенерируем
        
        [mutateGenes addObject:index]; //добавляем индекс

        NSString* newelement;
        do {
            newelement = [Cell randomElement]; //новый рандомный элемент 
        } while ([self . DNA objectAtIndex:[index unsignedIntegerValue]]==newelement); //не должен быть равен старому

        [self . DNA replaceObjectAtIndex:[index unsignedIntegerValue] withObject:newelement]; //меняем старый элемент на новый сгенерированный
    }
}

@end

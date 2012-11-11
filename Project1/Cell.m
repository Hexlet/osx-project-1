//
//  Cell.m
//  Project1
//
//  Created by Olga on 02.11.12.
//  Copyright (c) 2012 Olga. All rights reserved.
//

#import "Cell.h"

@implementation Cell

//создаем мутированный массив DNA
-(void)mutate:(int)x {
    
    //кол-во символов в массиве, которые нужно заменить
    int quantity = ([DNA count] * x/100);
    
    //массив с измененными символами
    NSMutableArray *mutatedDNA = [[NSMutableArray alloc]init];
    
    //проверяем, чтобы не трогать измененную ячейку
    for (int i=0; i<quantity; i++) {
        int randomElement = arc4random()%[DNA count];
        while ([mutatedDNA containsObject:[NSNumber numberWithInt:randomElement]]) {
            randomElement = arc4random()%[DNA count];
        }
        //запоминаем номер измененной ячейки
        [mutatedDNA addObject:[NSNumber numberWithInt:randomElement]];
        //запонимаем, что в изменнной ячейке стояло
        NSString *previous = [DNA objectAtIndex:randomElement];
        //заменяем на другой символ
        while ([previous isEqualToString:[DNA objectAtIndex:randomElement]]) {
            [DNA replaceObjectAtIndex:randomElement withObject:[DNAElements objectAtIndex:arc4random()%4]];
        }
        
        
    }
    

}

//cравнием случайный массив с переданным в аргумент (getDNA)
-(int)hammingDistance:(Cell *) cell {
    int result = 0;
    for (int i=0; i < [DNA count]; i++) {
         if (![[DNA objectAtIndex:i] isEqualToString: [[cell secondDNA] objectAtIndex:i]])
         {
             result++;
         }
    }
    return result;
}

//создаем второй массив для сравнения
-(NSMutableArray *)getDNA {
    return DNA;
}

//переписываем метод init
- (id)init {
    
    if (self = [super init]) {
        DNAElements = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        DNA = [[NSMutableArray alloc] init];
        
        // заполняем массив DNA случайным образом
        for (int i = 0; i < 100; i++) {
            [DNA addObject:[DNAElements objectAtIndex:arc4random()%4]];
        }
    }
    return self;
}


@end

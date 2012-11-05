//
//  Cell.m
//  DNK.Prj1.iPadchenko
//
//  Created by yury on 31.10.12.
//  Copyright (c) 2012 Yury Radchenko. All rights reserved.
//

#import "Cell.h"


@implementation Cell {
    
}

- (id) init {
    
    self = [super init];//вызываем инициализация от класса родителя, считаем это инициализацией себя
    
    if (self) { //если все ОК по родительской теме, тогда выполняем собственные особенности инициализации
        
        //Инициализируем массив
        _DNA = [NSMutableArray arrayWithCapacity:dnaLength];
        
        //Каждая ячейка вашего массива должна быть одним из этих четырех символов: A, T, G и С
        for (int i=0; i < dnaLength; i++)
            
            [self.DNA addObject:[self randomCellValueATGC]]; //добавляем в конец массива случайное значение
        
    }
    
    return self;//возвращаем самих себя
}

- (int) hammingDistance: (Cell *) secondDNA {
    
    int hD = 0; //изначально 0 совпадений
    
    for (int i = 0; i < dnaLength; i++)
        
        if (![[self.DNA objectAtIndex:i] isEqual:[secondDNA.DNA objectAtIndex:i]]) {
            
            hD++; //учитываем несовпадение
            
        }
    
    return hD;
}

- (void) print {
    
    NSString *dnaOneString = [[NSString alloc] initWithFormat:@"%@", [self.DNA componentsJoinedByString: @""]];
    
    //NSLog(@"name = %@", self);//расскоментировать, если надо видеть класс и адрес переменной
    NSLog(@"ДНК = %@",dnaOneString);

}

- (NSString *) randomCellValueATGC { //процедура случаного выбора значений ячейки ДНК
    
    NSArray *ATGC = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        
    return [ATGC objectAtIndex:(arc4random() % ATGC.count)];
}

@end

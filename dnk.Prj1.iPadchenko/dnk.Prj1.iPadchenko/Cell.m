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
        
        //dnaLenght = (int) 5; //длина цепочки ДНК
        
        //Инициализируем массив
        _DNA = [NSMutableArray arrayWithCapacity:dnaLenght];
        
        //Каждая ячейка вашего массива должна быть одним из этих четырех символов: A, T, G и С
        for (int i=0; i < dnaLenght; i++)
            
            [self.DNA addObject:[self randomCellValueATGC]]; //добавляем в конец массива случайное значение
        
    }
    
    return self;//возвращаем самих себя
}

- (int) hammingDistance: (Cell *) secondDNA {
    
    int hD = 0; //изначально 0 совпадений
    
    for (int i = 0; i <= dnaLenght - 1; i++)
        
        if (![[self.DNA objectAtIndex:i] isEqual:[secondDNA.DNA objectAtIndex:i]])
            
            hD++; //учитываем несовпадение
    
    return hD;
}

//- (void) mutate: (int) xPercentMutator {
//    
//    if (xPercentMutator > 100)
//        
//        NSLog(@"Некорректно введен процент мутации");
//    
//    else {
//        
//        int xCount = (int) dnaLenght * xPercentMutator / 100; //кол-во ячеек ДНК, подлежащих изменению
//    
//        NSMutableArray *cellMutator = [NSMutableArray arrayWithCapacity:xCount]; //массив хранения номеров измененных ячеек ДНК
//                
//        int i = 0;
//    
//        do {
//            int randomIndex = (int) (arc4random() % (dnaLenght));  //выбираем случайную ячейку ДНК
//        
//            //сравниваем выбранный номер с ранее выпадавшими и запомненными
//        
//            if (![cellMutator containsObject:[NSString stringWithFormat:@"%d", randomIndex]]) {//если совпадений нет
//        
//                //запоминаем выбор
//                [cellMutator addObject:[NSString stringWithFormat:@"%d", randomIndex]];
//        
//                //меняем ячейку ДНК
//                [_DNA replaceObjectAtIndex:randomIndex withObject:[self randomCellValueATGC]];
//        
//                i++; //увеличиваем счетчик уже измененных ячеек ДНК
//                
//            }
//                
//        } while (i < xCount);
//    
//    }
//    
//}

- (void) print {
    
    NSMutableString *dnaOneString = [[NSMutableString alloc] init];
    
    for (int i = 0; i < dnaLenght; i++)
        
        [dnaOneString appendString:[self.DNA objectAtIndex:i]];//код ДНК формируем одной строкой
    
    //NSLog(@"name? = %@", self);//расскоментировать, если надо видеть класс и адрес переменной
    NSLog(@"ДНК = \n%@",dnaOneString);

}

- (NSString *) randomCellValueATGC { //процедура случаного выбора значений ячейки ДНК
    
    NSString *ATGC = [[NSString alloc] init];
        
    switch ((int) (arc4random() % 4)) { //случайное целое число от 0 до 3
        case 0: ATGC = @"A"; break;
        case 1: ATGC = @"T"; break;
        case 2: ATGC = @"G"; break;
        case 3: ATGC = @"C"; break;
    }
    
    return ATGC;
}

@end

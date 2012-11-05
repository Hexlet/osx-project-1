//
//  Cell+Mutator.m
//  DNApp
//
//  Created by Oleksandr Gnatisin on 02.11.12.
//  Copyright (c) 2012 Oleksandr Gnatisin. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)

-(void) mutate: (int) persentOfElement {
    
    // Защита от ввода неверного процента
    if(persentOfElement < 0 || persentOfElement > 100 ) {
        return NSLog(@"Указано некоректное процентное значение мутации");
    }
    
    // Первод процентов в единицы
    int countOfElement = dnaCapacity*persentOfElement/100;
    
    // Создаем масив-список
    NSMutableArray *replaceList = [[NSMutableArray alloc] initWithCapacity:dnaCapacity];
        for (int i = 0; i < dnaCapacity; i++) {
            [replaceList addObject:@(i)]; // Единицы в стринг
        }
    
        // Заменяем элементы в ДНК
        int i = countOfElement;
    
        while (i > 0) {
            int nIndexForReplace = arc4random() % [replaceList count];
            
            // Получаем из массива индекс элемента после рандома
            
            NSMutableArray *copyOfRandomArray = [[NSMutableArray alloc] initWithArray:self.randomArray]; // Делаем копию массива с буквами
            
            int elementIndex = [[replaceList objectAtIndex: nIndexForReplace] intValue]; // Из стринга назад в единицы
            
            NSString *currentState = [self.dna objectAtIndex:elementIndex]; //Берем из массива ДНК состояние нужного обьекта
            
            [copyOfRandomArray removeObjectIdenticalTo: currentState]; // Удаляем из массива обьект который совпадает с з нашим обьектом из массива ДНК
            
            NSInteger countAtg = [copyOfRandomArray count]; // Считаем количество елементов в нашей копии массива randomArray
            
            [self.dna replaceObjectAtIndex:elementIndex withObject:[copyOfRandomArray objectAtIndex:random() % countAtg]]; // Заменf мут. обьект из массива ДНК  рандомным обьектом зи копии масива randomArray
            
            // Удаляем замененынй обьект из массива
           
            [replaceList removeObjectAtIndex:nIndexForReplace];
            
            i--;
        }
}

@end

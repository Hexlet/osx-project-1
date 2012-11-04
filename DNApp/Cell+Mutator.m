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
        return;
    }
    
    // Первод процентов в единицы
    int countOfElement = dnaCapacity*persentOfElement/100;
    
    // Создаем масив-список
    NSMutableArray *replaceList = [[NSMutableArray alloc] init];
        for (int i = 0; i < dnaCapacity; i++) {
            [replaceList addObject:@(i)]; // Единицы в стринг
        }
    
        // Заменяем элементы в ДНК
        int i = countOfElement;
    
        while (i > 0) {
            int nIndexForReplace = arc4random() % [replaceList count];
            
            // Получаем из массива индекс элемента после рандома
            int elementIndex = [[replaceList objectAtIndex: nIndexForReplace] intValue]; // Из стринга назад в единицы
            
            NSString *dnaString = [self.dna objectAtIndex:elementIndex];
            
            NSString *randomString = [self getRandom];
            
            // Условие - буквы не должны совпадать
            if (dnaString != randomString) {
                [self.dna replaceObjectAtIndex:elementIndex withObject:randomString];
                
                // Удаляем замененынй обьект из массива
                [replaceList removeObjectAtIndex:nIndexForReplace];    
                
                i--;
            }
        }
}

@end

//
//  Cell.h
//  DNAFactory
//
//  Created by Ilya Rezyapkin on 01.11.12.
//  Copyright (c) 2012 Ilya Rezyapkin. All rights reserved.
//

// Максимальная длина цепочки
#define MAX_NUCLEOTIDES 100

#import <Foundation/Foundation.h>


@interface Cell : NSObject

@property NSMutableArray *DNA;

// Статический метод для случайного выбора нуклеотида. Посткольку не зависит от конкретного экземпляра, то сделан статическим.
+(NSString *) getRandomNucleotide;

// Новый init
-(id) init;
-(void) print; // Вывод массива в консоль
-(int) hammingDistance: (Cell *) _cell; // 

@end

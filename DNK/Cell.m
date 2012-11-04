//
//  Cell.m
//  DNK
//
//  Created by someone on 11/1/12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import "Cell.h"


// Общая информация для всех экземпляров класса
int              DNALength;          // Длина DNA
NSArray          * alphabet;         // Набор символов для формирования DNA
unsigned long    alphabetLength;     // Количество символов в наборе


@implementation Cell : NSObject


// Инициализируем общую информацию
+(void) initialize {
    if (self == [Cell class]) {
        DNALength = 100;
        alphabet = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C",nil];
        alphabetLength = [alphabet count];
    }
}


-(id) init {
    
    self = [super init];
    
    if (self) {
        self.DNA = [[NSMutableArray alloc] init];
        
        // Генерируем DNA
        for (int i = 0; i < DNALength; i++) {
            [self.DNA addObject:[self generateGen]];
        }
    }
    
    return self;
}


// Вынес в отдельный метод, потому что код используется в двух местах
-(NSString *) generateGen {
    return [alphabet objectAtIndex:(arc4random() % alphabetLength)];
}


-(int) hammingDistance: (Cell *) anotherDNA {
    
    int distance = 0;
    
    // Перебираем индексы массива, в котором хранится DNA
    for (int i = 0; i < DNALength; i++) {
        if ([[self.DNA objectAtIndex:i] isEqualTo:[anotherDNA.DNA objectAtIndex:i]] == NO) {
            // Если на данной позиции различные символы, увеличиваем дистанцию
            distance++;
        }
    }
    return distance;
}


-(void) print {
    
    // Ощущение, что можно сделать проще
    
    NSMutableString *output = [[NSMutableString alloc] init];
    
    for (int i = 0; i < DNALength; i++) {
        [output appendString:[_DNA objectAtIndex:i]];
    }
    
    NSLog(@"%@", output);
}


@end

//
//  Cell.m
//  ProjectDNA
//
//  Created by Alexander Kipman on 04.11.12.
//  Copyright (c) 2012 Alexander Kipman. All rights reserved.
//

#import "Cell.h"

@implementation Cell

//  Cобственный метод init
//  В этом методе создается массив из 100 элементов.
//  Значение каждого элемента массива задается в случайном порядке из множества A, T, G и С.
- (id)init{
    self = [super init];
    
    DNA = [[NSMutableArray alloc] initWithCapacity:100];
    
    for (int i = 0; i < 100; i++) {
        [DNA addObject: [self getRandomChar]];
    }
    
    return self;
}

- (NSMutableArray *)getDNA{
    return DNA;
}

//  Функция возвращает случайный символ из заданного множества символов A, T, G, С.
- (NSString*)getRandomChar{
    NSString* randomChar = @"ATGC";
    
    return [NSString stringWithFormat:@"%C", [randomChar characterAtIndex:arc4random() % [randomChar length]]];
}

//  Функция сравнивает ДНК созданный в методе init и ДНК переданного в качестве аргумента объекта и
//  возвращает количество позиций где символы ДНК не совпадают.
- (int)hammingDistance: (NSMutableArray*)DNA1{
    int cnt = 0;
    
    for (int i = 0; i < 100; i++){
        if (![[DNA objectAtIndex:i] isEqualToString: [DNA1 objectAtIndex:i]]){
            ++cnt;
        }
    }
    
    return cnt;
}

@end

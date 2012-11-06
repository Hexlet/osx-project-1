//
//  Cell+Mutator.m
//  DNA
//
//  Created by Игорь Скачков on 06.11.12.
//  Copyright (c) 2012 Игорь Скачков. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell(Mutator)

-(void) mutate:(int)percent {
    // Проверяем входящие параметры
    if (percent > 100 || percent < 0) {
        [NSException raise:@"Invalid percent value" format:@"percent of %d is invalid", percent];
        return;
    }
    NSLog(@"Mutating for %i percents", percent);
    // В нашем конкретном случае можно было бы и не вычислять проценты, у нас
    // как раз 100 элементов.
    int count = round((float)([self.DNA count] / 100.0) * percent);
    
    // Массив с индексами измененных элементов ДНК
    NSMutableArray *changed = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < count; i++) {
        int position = arc4random() % [self.DNA count];
        while ([changed containsObject:[NSNumber numberWithInt:position]]) {
            NSLog(@"Nucleotide at index %i has mutated. Trying get another index.", position);
            position = arc4random() % [self.DNA count];
        }
        
        // Заменяем нуклеотид. Учитываем, что надо замена на аналогичный не подходит
        NSString* nucleotide = [self getRandomNucleotide];
        while ([self.DNA[position] isEqualTo:nucleotide]) {
            nucleotide = [self getRandomNucleotide];
        }
        
        [self.DNA replaceObjectAtIndex:position withObject:nucleotide];
        [changed addObject:[NSNumber numberWithInt:position]];
    }
}

@end

//
//  Cell+mutator.m
//  DNA
//
//  Created by phantom on 08.11.12.
//
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

- (void) mutate:(int)percent {
    NSUInteger number = [Cell DNALength] * percent / 100;
    // Массив индексов символов для замены
    NSMutableArray * indices = [NSMutableArray array];
    NSUInteger i;
    // Заполняем массив числами от 1 до длины ДНК
    for (i = 0; i < [Cell DNALength]; i++) {
        [indices addObject:@(i)];
    }
    // Перемешиваем
    for (i = 0; i < number; i++) {
        [indices exchangeObjectAtIndex:i withObjectAtIndex:(i + random() % ([Cell DNALength] - i))];
        
        NSNumber * ind = [indices objectAtIndex:i];
        NSString * newNucl = [[Cell allNucleotides] objectAtIndex:random() % 4];
        [[self DNA] replaceObjectAtIndex:[ind integerValue] withObject:newNucl];
    }
}

@end

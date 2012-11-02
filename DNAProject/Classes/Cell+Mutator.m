//
// Created by eugenedymov on 31.10.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Cell+Mutator.h"
#import "CellElement.h"
#import "NSMutableArray+Shuffle.h"


@implementation Cell (Mutator)

- (void)mutate:(int)mutationPercent {
    if (mutationPercent < 0 || mutationPercent > 100) {
        NSLog(@"Please enter valid percents number");
        return;
    }

    if (mutationPercent == 0) {
        return;
    }

    if (mutationPercent == 100) {
        for (CellElement *element in self.dna) {
            [element randomizeExcludingCurrentValue];
        }

        return;
    }

    // Количество элементов, которые должны мутировать
    NSUInteger mutationCount = (NSUInteger) (kCellDNALength * mutationPercent / 100);

    // Вспомогательный массив индексов
    static NSMutableArray *mutatingIndices = nil;
    if (!mutatingIndices) {
        mutatingIndices = [[NSMutableArray alloc] init];

        for (NSUInteger i = 0; i < kCellDNALength; ++i) {
            [mutatingIndices addObject:[NSNumber numberWithUnsignedInteger:i]];
        }
    }

    // Перемешиваем
    [mutatingIndices shuffle];

    for (NSUInteger i = 0; i < mutationCount; ++i) {
        NSNumber *indexToMutate = mutatingIndices[i];
        CellElement *cellElement = self.dna[indexToMutate.unsignedIntValue];

        // Мутируем элемент
        [cellElement randomizeExcludingCurrentValue];
    }
}

@end
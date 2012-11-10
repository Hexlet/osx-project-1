//
//  main.m
//  dna
//
//  Created by Yuri Kirghisov on 07.11.12.
//  Copyright (c) 2012 Yuri Kirghisov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#include <stdlib.h>

@interface Cell (Mutation)

- (void)mutate:(int)percentage;

@end

@implementation Cell (Mutation)

- (void)mutate:(int)percentage
{
    if (percentage < 0 || percentage > 100) {
        // Неверное значение.
        return;
    }

    // Определяем кол-во мутирующих генов
    int genesToMutate = percentage * self.DNA.count / 100;
    NSUInteger dnaLength = self.DNA.count;
    
    // Строим два массива - индексы немутирующих генов (все индексы) и мутирующих (сначала пуст)
    NSMutableArray *outstandingIndexes = [NSMutableArray arrayWithCapacity:dnaLength];
    NSMutableArray *mutatingIndexes = [NSMutableArray arrayWithCapacity:dnaLength];
    for (NSUInteger index = 0; index < dnaLength; index++)
        [outstandingIndexes addObject:[NSNumber numberWithUnsignedInteger:index]];

    // И в случайном порядке переносим genesToMutate индексов из первого массива во второй
    for (int i = 0; i < genesToMutate; i++) {
        int r = arc4random_uniform((u_int32_t)outstandingIndexes.count);
        NSNumber *index = outstandingIndexes[r];
        [mutatingIndexes addObject:index];
        [outstandingIndexes removeObject:index];
    }
    
    // Теперь для мутирующих генов подбираем случайное новое значение, не совпадающее с текущим
    for (int i=0; i<mutatingIndexes.count; i++) {
        NSUInteger index = [mutatingIndexes[i] unsignedIntegerValue];
        NSString *place = self.DNA[index];
        NSMutableArray *genesToSelect = [NSMutableArray arrayWithArray:@[@"A", @"T", @"G", @"C"]];
        [genesToSelect removeObject:place];
        NSString *newValue = genesToSelect[arc4random_uniform(genesToSelect.count)];
        [self.DNA replaceObjectAtIndex:index withObject:newValue];
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        
        NSLog (@"Old Hamming Distance: %d", [cell1 hammingDistance:cell2]);
        [cell1 mutate:2];
        [cell2 mutate:2];
        NSLog (@"New Hamming Distance: %d", [cell1 hammingDistance:cell2]);
}

    return 0;
}


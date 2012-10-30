//
//  Cell.m
//  Project1
//
//  Created by sashkam on 30.10.12.
//  Copyright (c) 2012 Verveyko Alexander. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (NSString *) getRandomDNASymbol{
    //Вспомогательный метод, возвращает один случайный символ ДНК из возможных
    NSArray *DNASymbols = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
    return [DNASymbols objectAtIndex:(arc4random() % [DNASymbols count])];
}

- (id)init
{
    self = [super init];
    if (self) {
        self.DNA = [NSMutableArray arrayWithCapacity:100];
        //Заполним цепочку ДНК
        for (int i=0; i<100; i++) {
            [self.DNA addObject:[self getRandomDNASymbol]];
        }
    }
    return self;
}

- (int) hammingDistance:(Cell *)anCell{
    int distance = 0;
    for (int i=0; i<100; i++) {
        //Если элементы с одинаковыми индексами НЕ совпадают, наращиваем счетчик
        if ( ! [[anCell.DNA objectAtIndex: i] isEqualToString:[self.DNA objectAtIndex: i]]){
            distance++;
        }
    }
    return distance;
}
@end

@implementation Cell (mutator)

- (void) mutate:(int)percent{
    //Создать массив уникальных индексов для изменения
    NSMutableArray *uniqueIndexes = [NSMutableArray arrayWithCapacity:percent];
    while ([uniqueIndexes count] != percent) {
        NSNumber *index = [NSNumber numberWithInt: arc4random() % 100];
        //Нелинейное время, но для массива из 100 чисел имхо достаточно=)
        if ( ! [uniqueIndexes containsObject: index]){
            [uniqueIndexes addObject:index];
        }
    }
    //Меняем обьекты по полученным индексам
    for (NSNumber *index in uniqueIndexes){
        [self.DNA replaceObjectAtIndex:[index intValue] withObject:[self getRandomDNASymbol]];
    }
}
@end



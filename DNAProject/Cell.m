//
//  Cell.m
//  DNAProject
//
//  Created by alex on 31/10/2012.
//  Copyright (c) 2012 alex. All rights reserved.
//

#import "Cell.h"

@implementation Cell (mutator)

-(void) mutate: (int)X
{
    // количество ячеек, которые нужно заменить
    int n = (int)floor(DNA.count*X/100);
    NSMutableArray *exists = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < n; i++) {
        // следим, чтобы не воткнуть новый элемент в уже измененную ячейку
        int k = arc4random()%DNA.count;
        while ([exists containsObject:[NSNumber numberWithInteger:k]]) {
            k = arc4random()%DNA.count;
        }
        // добавляем номер ячейки в список измененных
        [exists addObject:[NSNumber numberWithInteger:k]];
        
        // запоминаем, что у нас на этом месте стояло
        NSString *prev = [DNA objectAtIndex:k];
        // и заменяем на другой(!) элемент
        while ([prev isEqualToString:[DNA objectAtIndex:k]]) {
            [DNA replaceObjectAtIndex:k withObject:[DNAElements objectAtIndex:arc4random()%4]];
        }
    }
}

@end


@implementation Cell

-(id) init
{
    if (self = [super init]) {
        DNAElements = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        DNA = [[NSMutableArray alloc] init];
        // заполняем массив DNA случайными элементами
        for (int i = 0; i < 100; i++) {
            [DNA addObject:[DNAElements objectAtIndex:arc4random()%4]];
        }
        //NSLog(@"%@", DNA);
    }
    return self;
}

-(NSMutableArray*) getDNA
{
    return DNA;
}

-(int) hammingDistance:(Cell *)cell
{
    int result = 0;
    
    for (int i = 0; i < DNA.count; i++) {
        if (![[DNA objectAtIndex:i] isEqualToString: [[cell getDNA] objectAtIndex:i]]) {
            result++;
        }
    }
    
    return result;
}

// нужно только для тестирования
+(id) copyCell:(Cell *) cell
{
    Cell *result = [[Cell alloc] init];
    NSMutableArray *dest = [result getDNA];
    NSMutableArray *source = [cell getDNA ];
    for (int i = 0; i < source.count; i++) {
        [dest replaceObjectAtIndex:i withObject: [source objectAtIndex:i]];
    }
    return result;
}

@end

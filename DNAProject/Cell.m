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
    for (int i = 0; i < DNA.count; i++) {
        // заменяем X процентов элементов в массиве DNA другими элементами
        if (arc4random()%100 <= X) {
            // запоминаем, что у нас на этом месте стояло
            NSString *prev = [DNA objectAtIndex:i];
            // и заменяем на другой(!) элемент
            while ([prev isEqualToString:[DNA objectAtIndex:i]]) {
                [DNA replaceObjectAtIndex:i withObject:[DNAElements objectAtIndex:arc4random()%4]];
            }
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

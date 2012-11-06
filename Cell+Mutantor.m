//
//  Cell+Mutantor.m
//  DNA
//
//  Created by Ivancov Alexander on 11/3/12.
//  Copyright (c) 2012 GameStore. All rights reserved.
//

#import "Cell+Mutantor.h"

@implementation Cell (Mutantor)

- (void)mutateElementWithNumber:(NSInteger)x
{
    if (x < 0 || x > 100) {
        NSException *error = [NSException exceptionWithName:@"WrongPercentNumber" reason:@"Wrong Number Percent" userInfo:nil];
        @throw error;
    }
    else
    {
        NSArray *typeHromosome = @[@"A", @"T", @"G", @"C"];
        // случайное значение для значения конкретной хромосоме
        int rand = arc4random()%4;

        while ([[self.DNA objectAtIndex: x] isEqual: [typeHromosome objectAtIndex: rand]]){
            rand = arc4random()%4;
        }
        [self.DNA replaceObjectAtIndex: x withObject: [typeHromosome objectAtIndex: rand]];
    }
}

- (void)mutatePercent:(int)x
{
    NSMutableArray *rand = [[NSMutableArray alloc] init];
    NSMutableArray *positionNotUse = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < 100; ++i) {
        [positionNotUse addObject:[NSNumber numberWithInt: (int)i]];
    }
    
    // получаем список случайных х процентов номеров позиций
    for (NSInteger i = 0; i < x; ++i)
    {
        NSNumber *num = [NSNumber numberWithInt: arc4random() % [positionNotUse count]];
        
        [rand addObject: [positionNotUse objectAtIndex: [num integerValue]]];
        [positionNotUse removeObjectAtIndex:[num integerValue]];
    }
    
    // замена следующих из списка номеров хромосом
    for (NSInteger i = 0; i < [rand count]; ++i)
        [self mutateElementWithNumber: [[rand objectAtIndex: i] integerValue]];
}

@end

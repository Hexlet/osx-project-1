//
//  Cell.m
//  DNAProject
//
//  Created by Maxim Tushevskiy on 05.11.12.
//  Copyright (c) 2012 Maxim Tushevskiy. All rights reserved.
//

#import "Cell.h"

@implementation Cell
- (id)init
{
    self = [super init];
    if (self) {
        size = 100; //Размер цепочки ДНК
        letters = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil]; // Возможные значения ячеки ДНК
        DNA = [NSMutableArray array];
        for (int i = 0; i<size; i++) {
            [DNA insertObject:[letters objectAtIndex:arc4random()%4] atIndex:i]; // Заполнение клетки ДНК случайными значениями из возможных
            
        }
    }
    return self;
}
-(int)hammingDistance:(Cell*)cell
{
    // Последовательное сравлнение двух цепочек ДНК
    int hd = 0;
    for (int i = 0; i<size; i++) {
        if ([DNA objectAtIndex:i] != [[cell DNA] objectAtIndex:i]) {
            hd++;
        }
    }
    return hd;
}
-(NSMutableArray*)DNA
{
    return DNA;
}
@end

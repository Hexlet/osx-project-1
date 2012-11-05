//
//  Cell.h
//  DNK.Prj1.iPadchenko
//
//  Created by yury on 31.10.12.
//  Copyright (c) 2012 Yury Radchenko. All rights reserved.
//
#define dnaLength 100 //длина цепочки ДНК

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

- (int) hammingDistance: (Cell *) secondDNA ; //сравнение 2х ДНК: результат - количество позиций, где символы ДНК не совпадают

- (void) print;

- (NSString *) randomCellValueATGC;

@end

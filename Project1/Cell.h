//
//  Cell.h
//  Project1
//
//  Created by sashkam on 30.10.12.
//  Copyright (c) 2012 Verveyko Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_LENGHT 100                          //Длина цепочки ДНК
#define DNA_SYMBOLS @[@"A", @"T", @"G", @"C"]   //Азотистые основания
#define DNA_SYMBOLS_COUNT 4                     //Количество DNA_SYMBOL

@interface Cell : NSObject

@property NSMutableArray *DNA;
- (int) hammingDistance: (Cell *) anCell;

@end



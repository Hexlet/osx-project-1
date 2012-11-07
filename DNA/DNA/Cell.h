//
//  Cell.h
//  DNA
//
//  Created by Meriados on 03.11.12.
//  Copyright (c) 2012 Meriados. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAX_LEN 100

@interface Cell : NSObject
{
  NSMutableArray *DNA;
}
- (Cell*) init;
- (void) dealloc;
- (int) hammingDistanceWithCell:(Cell*) sCell;

- (NSString *) getRandomChar; // метод, генерирующий случайный символ. Множество символов указано внутри данного метода

@end
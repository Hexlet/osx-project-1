//
//  Cell.m
//  DNA_project
//
//  Created by swante on 10/31/12.
//  Copyright (c) 2012 swante. All rights reserved.
//

#import "Cell.h"

@implementation Cell

// Переопределение инициализации
-(id)init
{
  self = [super init];
  
  if(self)
  {
    self.dna = [NSMutableArray new];
    self.dict = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
    
    // Заполнение DNA случайными значениями из словаря
    for(int i = 0; i < DNA_LENGTH; ++i)
      [self.dna addObject: [self.dict objectAtIndex: arc4random() % 4]];
  }
  
  return self;
}

// Хэммингово расстояние
-(int)hammingDistance:(Cell *)c
{
  int hDistance = 0;
  
  for(int i = 0; i < DNA_LENGTH; ++i)
  {
    if([[self.dna objectAtIndex:i] isNotEqualTo:[c.dna objectAtIndex:i]])
      ++hDistance;
  }
  
  return hDistance;
}

@end

@implementation Cell (mutator)

// Замена X процентов символов в DNA в случайном порядке
-(void)mutate:(int)xPercents
{
  // Ограничение диапазона xPercents
  if(xPercents <= 0)
    return;
  else if(xPercents > 100)
    xPercents = 100;
  
  long x = lround(DNA_LENGTH * 0.01 * xPercents); // Пересчитываем проценты в целое число символов
  int  changedSymbolsCount = 0;                   // Счетчик измененных символов
  BOOL symbolChanged[DNA_LENGTH];                 // Флаги изменения символов
  
  // Сброс всех флагов изменения
  for(int i = 0; i < DNA_LENGTH; ++i)
    symbolChanged[i] = NO;
  
  // Пока не будет изменено X символов
  while(changedSymbolsCount < x)
  {
    int dnaIndex = arc4random() % DNA_LENGTH; // Случайный индекс в DNA
    
    // Пока символ по этому индексу не изменится
    while(symbolChanged[dnaIndex] == NO)
    {
      int dictIndex = arc4random() % 4; // Случайный индекс в словаре
      
      // Если символ из словаря не совпадает с символом из DNA
      if([[self.dna objectAtIndex:dnaIndex] isNotEqualTo:[self.dict objectAtIndex:dictIndex]])
      {
        // Меняем символ в DNA
        [self.dna replaceObjectAtIndex:dnaIndex withObject:[self.dict objectAtIndex:dictIndex]];
        symbolChanged[dnaIndex] = YES; // Меняем флаг изменения символа
        ++changedSymbolsCount; // Увеличиваем число измененных символов
      }
    }
  }
}

@end

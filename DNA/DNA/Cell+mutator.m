//
//  Cell+mutator.m
//  DNA
//
//  Created by Meriados on 04.11.12.
//  Copyright (c) 2012 Meriados. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
-(void) mutateWith:(uint)percent {
  // я аполитичен, но иного объяснения появления числа > 100% придумать не могу
  if (percent > 100) {
    NSLog(@"Замечен представитель партии \"Единая Россия\". Происходит экстренное завершение программы...");
    exit(1);
  }
  
  // переводим проценты в количество символов
  uint charCount = percent * MAX_LEN / 100;
  
  NSMutableArray *usedPosition = [[NSMutableArray alloc] init]; // массив, хранящий уже замененные позиции массива DNA
  NSString *newChar;
  uint position = 0;
  
  while (charCount > 0) {
    // получаем случайную новую поизицию
    position = rand() % MAX_LEN;
    
    // проверяем заменяли ли уже ее и если да, то начинаем итерацию заново
    if ([usedPosition containsObject: [NSNumber numberWithInt:position]])
      continue;
    
    // сгенерирована новая позиция, можно продолжать
    // генерим символ отличный от текущего
    do {
      newChar = nil;
      newChar = [self getRandomChar];
    }
    while (newChar == [DNA objectAtIndex:position]);
    // и заменяем
    [DNA replaceObjectAtIndex:position withObject:newChar];
    
    // отмечаем позицию как использованную и умньшаем кол-во символов
    [usedPosition addObject: [NSNumber numberWithInt:position]];
    charCount--;
    
  }
  
  [usedPosition removeAllObjects];
  usedPosition = nil;
  newChar = nil;
}
@end

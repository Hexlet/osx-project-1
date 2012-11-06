//
//  Cell+Mutator.h
//  DNA2
//
//  Created by Evgeny Pozdnyakov on 04.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@interface Cell (Mutator)

// метод трансформирует цепь нуклеотидов (поле DNA)
// заменяя в нем произвольным образом ровно x нуклеотидов
- (void) mutate:(int)percentOfMutation;

// метод находит нуклеотид с заданными индексом
// и заменяет его на какой-то другой
- (void) changeNucleotideAtPosition:(int)index;

@end

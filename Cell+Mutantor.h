//
//  Cell+Mutantor.h
//  DNA
//
//  Created by Ivancov Alexander on 11/3/12.
//  Copyright (c) 2012 GameStore. All rights reserved.
//

#import "Cell.h"

@interface Cell (Mutantor)

// Замена хромосомы с номером переданным по параметру (дополнительная функция для мутации)
- (void)mutateElementWithNumber: (NSInteger)x;
// Замена случайным образом х процентов хромосом из ДНК
- (void)mutatePercent: (int)x;

@end

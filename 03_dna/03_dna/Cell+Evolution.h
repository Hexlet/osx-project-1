//
//  Cell+Evolution.h
//  03_dna
//
//  Created by Stas on 11/9/12.
//  Copyright (c) 2012 Stas. All rights reserved.
//

#import "Cell.h"

@interface Cell (Evolution)                             // категория Cell (Evolution)
-(void) mutate: (int) percent;                          // интерфейс метода категории
extern int const LENGTH_ARRAY;                          // подключаем внешние константы
extern NSString const *ch[4];                           // подключаем внешние константы
@end                                                    // конец интерфейса категории

//
// Created by eugenedymov on 31.10.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)

/* Мутирует заданный процент элементов */
- (void)mutate:(int)mutationPercent;

@end
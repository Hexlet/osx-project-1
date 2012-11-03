//
//  Cell+mutator.h
//  DNA
//
//  Created by Meriados on 04.11.12.
//  Copyright (c) 2012 Meriados. All rights reserved.
//

#import "Cell.h"

// добавил после изучения чужих работ. Правда я не считаю, что в данном случае это очень важно, но раз стандарт, то пусть будет
@interface Cell (mutator)
- (void) mutateWith:(uint)percent;
@end

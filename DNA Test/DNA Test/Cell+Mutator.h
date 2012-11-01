//
//  DNACell+Mutator.h
//  DNA Test
//
//  Created by Evgeny Golubev on 31.10.12.
//  Copyright (c) 2012 Evgeny Golubev. All rights reserved.
//

#import "Cell.h"

@interface Cell (Mutator)

// Описываем наличие метода мутирования
-(void) mutate: (int) mutatePercent;

@end

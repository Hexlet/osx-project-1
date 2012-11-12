//
//  Cell+mutator.h
//  DNA
//
//  Created by Администратор on 11/7/12.
//  Copyright (c) 2012 Nope. All rights reserved.
//

#import "Cell.h"

@interface Cell (mutator)

-(void) mutate: (int) percent;
-(void) randomNucleotideAtIndex: (int) Index;   //Метод для мутации нуклеотида по индексу
@end

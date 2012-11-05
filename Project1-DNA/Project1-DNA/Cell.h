//
//  Cell.h
//  Project1-DNA
//
//  Created by Администратор on 11/4/12.
//  Copyright (c) 2012 Kirill.Muratov. All rights reserved.
//


@interface Cell : NSObject

-(int) hammingDistanse: (Cell*) cell;

-(NSMutableArray *) getDNA;

-(id) getNucleotideAtIndex: (int) index;

@end

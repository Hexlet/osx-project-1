//
//  Cell+Mutator.h
//  mac101p1DNA
//
//  Created by Voleg on 06.11.12.
//  Copyright (c) 2012 Voleg. All rights reserved.
//

#import "Cell.h"

@interface Cell (Mutator)
-(void) mutate: (NSUInteger) x;
//-(void) replaceMolsIn: (Cell *) dnacells To:(NSMutableArray *)newMoleculas AtIndexes:(NSIndexSet *)indexes;
@end



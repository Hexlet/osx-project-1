//
//  Cell+Mutator.h
//  DNAProject
//
//  Created by S.Lebedev on 08.11.12.
//  Copyright (c) 2012 S.Lebedev. All rights reserved.
//

#import "Cell.h"

@interface Cell (Mutator) // категория Mutator класса Cell
-(void)mutate:(int)x; // для изменения х% последовательности
@end

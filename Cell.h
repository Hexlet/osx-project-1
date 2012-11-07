//
//  Cell.h
//  DNA
//
//  Created by Dmytro Povechanin on 06.11.12.
//  Copyright (c) 2012 Dmytro Povechanin. All rights reserved.
//

#import <Foundation/Foundation.h>

extern int const CELL_DIMENTION;

@interface Cell : NSObject

    -(NSMutableArray *) getDNA;
    +(int) hammingDistance:(Cell*) srcDNA trgt:(Cell *) trgtDNA;

@end
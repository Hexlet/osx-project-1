//
//  Cell.h
//  osx-project-1
//
//  Created by Ivan Ushakov on 11/5/12.
//  Copyright (c) 2012 Ivan Ushakov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Molecule.h"

#define CELL_SIZE 100

@interface Cell: NSObject
{
    
    NSMutableArray *dna;
    
}

-(Molecule *)moleculeAtIndex: (NSUInteger)index;

-(NSString *)toString;

-(int)hammingDistance: (Cell *)toCell;

@end

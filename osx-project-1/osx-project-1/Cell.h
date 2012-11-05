//
//  Cell.h
//  osx-project-1
//
//  Created by Mikhail on 02.11.12.
//  Copyright (c) 2012 Mikhail. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MyChar.h"


@interface Cell : NSObject

@property NSMutableArray *DNA;


-(int) hammingDistance: (Cell*) cell;

+(char) randNucleotide;

@end

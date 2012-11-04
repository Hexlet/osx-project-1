//
//  Cell.h
//  DNA
//
//  Created by Erik Khalimov on 01.11.12.
//  Copyright (c) 2012 Erik Khalimov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property (strong) NSMutableArray *dna;

-(int)hammingDistance:(Cell *)cell;

@end

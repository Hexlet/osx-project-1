//
//  Cell.h
//  osx-project-1
//
//  Created by Alex on 31.10.12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *dna;

- (id) setRandomValues: (NSArray*) dna forDna:(NSMutableArray*) validDnaSymbols;

- (int) hammingDistance: (Cell*) cell;

@end

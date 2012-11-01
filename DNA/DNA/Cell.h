//
//  Cell.h
//  DNA
//
//  Created by Gennadii Lukash on 10/31/12.
//  Copyright (c) 2012 Gennadii Lukash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(void) printDNA;
-(int) hammingDistance: (Cell*) dna_1;

@end

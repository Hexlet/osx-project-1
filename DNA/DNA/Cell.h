//
//  Cell.h
//  DNA
//
//  Created by Gennadii Lukash on 10/31/12.
//  Copyright (c) 2012 GL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

#define LENGHT_DNA_ARRAY 100
#define CHARS_DNA [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil]


@property NSMutableArray *DNA;

-(void) printDNA;
-(int) hammingDistance: (Cell*) dna_1;

@end

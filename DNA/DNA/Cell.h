//
//  Cell.h
//  DNA
//
//  Created by n on 12.11.12.
//  Copyright (c) 2012 n. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

-(int) hammingDistance: (Cell *) cell;
-(NSInteger) DNAsize;
-(NSString *) getDNAatIndex: (NSInteger)index;
-(void) setDNA: (NSString *) nucluotide atIndex: (NSInteger)index;
-(void) printDNA;
-(void) copyDNAfrom: (Cell *) cell;

@end

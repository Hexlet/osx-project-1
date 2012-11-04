//
//  Cell.h
//  DNA
//
//  Created by Arkadiy Pikalov on 10/31/12.
//  Copyright (c) 2012 Arkadiy Pikalov. All rights reserved.
//

#import <Foundation/Foundation.h>
#define CELL_SIZE 100
@interface Cell : NSObject

@property NSMutableArray* dna;

-(int) hammingDistance:(Cell*) other;
-(void) generateDNA;
-(void) print;
-(Cell*) clone;

@end

//
//  Cell.h
//  dna
//
//  Created by Evgeny Trefilov on 11/4/12.
//  Copyright (c) 2012 Evgeny Trefilov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gene.h"

@interface Cell : NSObject

@property (strong) NSMutableArray* dna;

-(id)initWithGenes:(int)amountOfGenes;

-(int)hammingDistance:(Cell*)cell;
-(NSString*) dnaString;

@end

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

-(void)setDnaElement:(Gene*)gene atIndex:(NSUInteger)index;
-(Gene*)dnaElementAtIndex:(NSUInteger)index;
-(NSUInteger)length;

-(id)initWithGenes:(int)amountOfGenes;

-(int)hammingDistance:(Cell*)cell;
-(NSString*) dnaString;

@end

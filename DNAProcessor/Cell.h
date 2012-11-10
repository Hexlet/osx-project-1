//
//  Cell.h
//  DNAProcessor
//
//  Created by Sergey Nebolsin on 10.11.12.
//  Copyright (c) 2012 Sergey Nebolsin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSArray *nucleicBases;
@property NSMutableArray *dna;

+(Cell *) cell;
-(void) print;

@end

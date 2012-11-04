//
//  Cell.h
//  osx-project-1
//
//  Created by Pavel Nikitin on 11/1/12.
//  Copyright (c) 2012 Pavel Nikitin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNARange.h"

@interface Cell : NSObject

@property NSMutableArray *DNA;
@property DNARange *range;

-(id) initWithDNA:(NSMutableArray *)initDNA;
-(int) hammingDistance:(Cell*)anotherCell;

@end

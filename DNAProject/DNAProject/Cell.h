//
//  Cell.h
//  DNAProject
//
//  Created by sagod on 03.11.12.
//  Copyright (c) 2012 Alexander Gudulin. All rights reserved.
//

#import <Foundation/Foundation.h>

NSArray const *ATGC;

@interface Cell : NSObject

@property NSMutableArray *DNA;
-(int)hammingDistance:(Cell *)cell;

@end

//
// Category
//
@interface Cell (mutator)

-(void)mutate:(int)percentages;

@end
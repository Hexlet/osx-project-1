//
//  Cell.h
//  dna
//
//  Created by Maksim Kuleshov on 02.11.12.
//  Copyright (c) 2012 Maksim Kuleshov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;
@property NSArray *setOfDNA;

-(id) initWithLength: (int)lengthOfDNA;
-(int)hammingDistance: (Cell *)c;

@end

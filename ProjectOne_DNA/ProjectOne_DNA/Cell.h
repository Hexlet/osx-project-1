//
//  Cell.h
//  ProjectOne_DNA
//
//  Created by mac on 30.10.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *dna;
@property (readonly) NSArray *dnaCode;

-(int)hammingDistance:(Cell *)cell;

@end

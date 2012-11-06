//
//  Cell.h
//  DNA
//
//  Created by Mac on 11/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

static const int DNA_SIZE = 100;

@interface Cell : NSObject

@property (strong) NSMutableArray *DNA;

-(int) hammingDistance: (Cell*) cell;

@end

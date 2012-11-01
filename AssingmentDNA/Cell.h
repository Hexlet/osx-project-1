//
//  Cell.h
//  AssingmentDNA
//
//  Created by LEV on 30.10.12.
//  Copyright (c) 2012 LEV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdlib.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;
@property NSString *genes;

-(int) hammingDistance: (Cell*) secondCell;

@end

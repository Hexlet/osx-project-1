//
//  Cell.h
//  DNA
//
//  Created by deron on 04.11.12.
//  Copyright (c) 2012 deron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property NSMutableArray *DNA;
@property NSArray *DNAsrc;
-(id)init;
-(int)hammingDistance: (Cell *) cell;
@end

//
//  Cell.h
//  OsXproject01
//
//  Created by John Smith on 11/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CELLSIZE 100

@interface Cell : NSObject

@property NSMutableArray *DNA;

- (int)hammingDistance: (Cell *)inputCell;

@end

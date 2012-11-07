//
//  Cell.h
//  HexletProject1
//
//  Created by F V on 11/1/12.
//  Copyright (c) 2012 F V. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(Cell *)init;
-(void)print;
-(int)hammingDistance: (Cell *) cellForCompare;

@end

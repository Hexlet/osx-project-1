//
//  Cell.h
//  osx-project-1
//
//  Created by Mac on 09.11.12.
//  Copyright (c) 2012 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(int) hammingDistance: (Cell *) cell;

@end

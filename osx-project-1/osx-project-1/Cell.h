//
//  Cell.h
//  osx-project-1
//
//  Created by Admin on 11/17/12.
//  Copyright (c) 2012 antonv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) NSMutableArray *DNA;

-(int)hammingDistance:(Cell*) cell;

@end

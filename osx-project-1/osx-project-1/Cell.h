//
//  Cell.h
//  osx-project-1
//
//  Created by Alex Pulichkin on 06.11.12.
//  Copyright (c) 2012 Alex Pulichkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;
@property NSArray *charsDNA;

-(int)hammingDistance:(Cell *) cell;

@end

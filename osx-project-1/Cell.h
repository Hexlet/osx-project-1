//
//  Cell.h
//  osx-project-1
//
//  Created by Roman Dolgopolov on 06.11.12.
//  Copyright (c) 2012 Roman Dolgopolov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

@property (readonly) int dnaCapacity;
@property (readonly) NSArray *Nucleobases;

-(id) init;
-(int) hammingDistance: (Cell*) cell;
@end

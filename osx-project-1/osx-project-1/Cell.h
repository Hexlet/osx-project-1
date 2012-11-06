//
//  Cell.h
//  osx-project-1
//
//  Created by mac mini on 04.11.12.
//  Copyright (c) 2012 hexlet. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DNA_SIZE 100 //size of DNA array

@interface Cell : NSObject

@property NSMutableArray* DNA;
- (id) init;
- (int) hammingDistance:(Cell*) otherCell;
- (NSString*) getNewGenom;
@end

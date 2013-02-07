//
//  Cell.h
//  osx-project-1
//
//  Created by Andrey Shindarev on 07.02.13.
//  Copyright (c) 2013 Andrey Shindarev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

- (id) initWithSize: (int) size;
- (int) hammingDistance: (Cell*) withCell;
+ (NSString*) getRandomElement: (NSString*) exceptElement;

@end

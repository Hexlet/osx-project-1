//
//  Cell.h
//  hexlet_project_DNA
//
//  Created by Igor Smirnov on 30.10.12.
//  Copyright (c) 2012 Igor Smirnov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Cell : NSObject

@property NSMutableArray *DNA;

- (Cell *) initWithLength: (int) len;
- (int) hammingDistance: (Cell *) aCell;
- (NSString *) getRandomPart;

@end

//
//  Cell.h
//  osx-project-1
//
//  Created by Aleksey Laletin on 13.11.12.
//  Copyright (c) 2012 alexion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) NSMutableArray *DNA;

- (int)hammingDistance:(Cell *)cell;

- (NSString *)getRandomLetter;

@end

@interface Cell (Mutator)

- (void)mutate:(int)percent;

@end
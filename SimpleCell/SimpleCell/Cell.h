//
//  Cell.h
//  SimpleCell
//
//  Created by Dmitry Svetlakov on 11/2/12.
//  Copyright (c) 2012 Dmitry Svetlakov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

extern const int MAX_ITEMS;
@property (readonly) NSMutableArray *DNA;

- (int)hammingDistance:(Cell *)comparedCell;
+ (NSArray *)availableKeys;

@end

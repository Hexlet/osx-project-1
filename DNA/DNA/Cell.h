//
//  Cell.h
//  DNA
//
//  Created by user on 11/6/12.
//  Copyright (c) 2012 azhohov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (nonatomic, readonly) NSMutableArray *DNA;

- (int)hammingDistance:(Cell *)aCell;


@end

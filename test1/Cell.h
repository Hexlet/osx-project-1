//
//  Cell.h
//  test1
//
//  Created by Leonov on 10.11.12.
//  Copyright (c) 2012 Leonov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) NSMutableArray *DNA;


-(int)hammingDistance:(Cell *)aCell;
@end

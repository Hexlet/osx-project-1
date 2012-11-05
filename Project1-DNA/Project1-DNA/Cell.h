//
//  Cell.h
//  Project1-DNA
//
//  Created by Nick Wishnyakov on 05.11.12.
//  Copyright (c) 2012 Nick Wishnyakov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;
@property NSArray *cellCollect;

-(int)hammingDistance: (Cell *)otherCell;

@end

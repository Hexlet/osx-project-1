//
//  Cell.h
//  DNA
//
//  Created by Sergey Buravtsov on 11/11/12.
//  Copyright (c) 2012 -. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_LENGTH  100

@interface Cell : NSObject {

    NSArray *dnaBlocksValues;
}

- (id)init;
- (int)hammingDistanceWith:(Cell *)cell;

@property (readonly) NSMutableArray *DNA;

@end

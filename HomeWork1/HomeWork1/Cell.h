//
//  Cell.h
//  HomeWork1
//
//  Created by fluke on 31.10.12.
//  Copyright (c) 2012 fluke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
    NSArray *genes;
    int capacity;
}

- (int) hammingDistance:(Cell *)cell;

@end

//
//  Cell.h
//  hw1
//
//  Created by Roman Filippov on 06.11.12.
//  Copyright (c) 2012 Roman Filippov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSMutableArray *_DNA;
}

@property (retain, nonatomic) NSMutableArray *DNA;

- (id) init;
- (NSString*) getSymbol;
- (NSMutableArray*) createNewOne;
- (NSUInteger) hammingDistanceWithCell:(Cell*) _cell;

@end

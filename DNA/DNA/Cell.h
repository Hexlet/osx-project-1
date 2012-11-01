//
//  Cell.h
//  DNA
//
//  Created by Ivan Glebov on 01.11.12.
//  Copyright (c) 2012 Ivan Glebov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
-(int) hammingDistance:(Cell*)DNA2;
@property NSMutableArray *DNA;
@end

//
//  Cell.h
//  osx-project-1
//
//  Created by undelalune on 31.10.12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

@interface Cell : NSObject

@property NSMutableArray *DNA;

- (int)hammingDistance:(Cell *)cell;

- (id)getAnotherDNACode:(NSString *)code;

- (NSString *)print;

@end

//
//  Cell.h
//  DNA
//
//  Created by Max Bazaliy on 31.10.12.
//  Copyright (c) 2012 Max Bazaliy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property(nonatomic) NSMutableArray *DNA;

- (int)hammingDistance: (Cell*)cell;
- (NSMutableArray*)fillArray: (NSArray*)array withRandomSymbolsCount:(int)count;

@end

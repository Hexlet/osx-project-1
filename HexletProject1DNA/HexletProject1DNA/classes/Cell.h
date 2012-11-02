//
//  Cell.h
//  HexletProject1DNA
//
//  Created by Sviatoslav on 02.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_SIZE 100
#define DNA_SYMBOLS_ALLOWED @"ATGС"

@interface Cell : NSObject

@property (nonatomic, readonly) NSMutableArray * DNA;

- (NSInteger)hammingDistance:(Cell *)cell;
- (NSString*)randomDNASymbol;

@end

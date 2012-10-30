//
//  Cell.h
//  DNAAssighment
//
//  Created by Oleg Langer on 30.10.12.
//  Copyright (c) 2012 Oleg Langer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

- (int) hammingDistance: (Cell*)cell;
- (NSString*) randomSymbol;

@end

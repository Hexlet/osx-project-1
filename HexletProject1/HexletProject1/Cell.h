//
//  Cell.h
//  HexletProject1
//
//  Created by Dmitry Remesov on 06.11.12.
//  Copyright (c) 2012 Dmitry Remesov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject <NSCopying>
@property (strong, readonly) NSMutableArray* dna;

+ (NSArray*) dnaSymbols;

- (NSUInteger)hammingDistance:(Cell*)anotherCell;

@end

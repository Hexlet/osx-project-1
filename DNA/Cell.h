//
//  Cell.h
//  DNA
//
//  Created by Alexander Madyankin on 04.11.12.
//  Copyright (c) 2012 Alexander Madyankin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *dna;
@property (readonly) int capacity;

+ (NSString*) randomBase;
- (int) hammingDistance: (Cell*) anotherCell;
- (void) print;

@end

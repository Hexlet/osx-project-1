//
//  Cell.h
//  dna
//
//  Created by Konstantin Tumalevich on 31.10.12.
//  Copyright (c) 2012 Konstantin Tumalevich. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_SIZE 100

@interface Cell : NSObject

@property (readonly) NSMutableArray *dna;
@property (readonly) NSArray *codes;

- (int) hammingDistance:(Cell*) another;
- (NSString*) getCode;
- (NSString*) getCode:(NSString *) oldCode;
@end

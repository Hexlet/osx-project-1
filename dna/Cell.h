//
//  Cell.h
//  dna
//
//  Created by Konstantin Tumalevich on 31.10.12.
//  Copyright (c) 2012 Konstantin Tumalevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) NSMutableArray *dna;
- (int) hammingDistance:(Cell*) another;
- (NSString*) getCode;
- (NSString*) getCode:(NSString *) oldCode;
@end

//
//  Cell.h
//  dna
//
//  Created by Pavel Kravets on 06.11.12.
//  Copyright (c) 2012 Pavel Kravets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) NSMutableArray* dnaArray;


    -(int) hammingDistance:(Cell*) other;

@end

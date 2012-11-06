//
//  Cell.h
//  DNA
//
//  Created by Straga on 06.11.12.
//  Copyright (c) 2012 Straga. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSString *acid[4];

@interface Cell : NSObject

@property NSMutableArray *dna;

-(int) hammingDistance:(Cell *)reactiv;

@end
//
//  Cell.h
//  DNA
//
//  Created by MacUser on 03.11.12.
//  Copyright (c) 2012 MacUser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
@property  NSMutableArray *dna;

+(NSString *) getRandomCode;
-(int) hammingDistance: (Cell*) otherCell;

@end

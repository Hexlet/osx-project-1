//
//  Cell.h
//  iDNA
//
//  Created by Darwin on 01.11.12.
//  Copyright (c) 2012 Ivo Dimitrov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (assign, readwrite) NSMutableArray *DNA;

-(int)hammingDistance:(Cell *) cell;

+(NSMutableArray *)getRandomDNA;
+(NSString *)getRandomSymbols;

@end

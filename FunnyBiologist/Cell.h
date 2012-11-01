//
//  Cell.h
//  FunnyBiologist
//
//  Created by Paul Dmitryev on 30.10.12.
//  Copyright (c) 2012 Paul Dmitryev. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DNA_SIZE 100

@interface Cell : NSObject

@property NSMutableArray *DNA;

+(NSString*)getRandomDNA;
-(NSUInteger)hammingDistance:(Cell*) other;

@end

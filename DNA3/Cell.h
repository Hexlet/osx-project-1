//
//  Cell.h
//  DNA3
//
//  Created by Igor Nikonov on 03.11.12.
//  Copyright (c) 2012 ngoro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject 

@property NSMutableArray* DNA;

-(int)hammingDistance:(Cell*) another;

+(NSString*)getRandomLetter;

@end

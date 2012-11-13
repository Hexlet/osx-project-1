//
//  Utils.h
//  DNAapplication
//
//  Created by Admin on 11/9/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+(NSUInteger) getRandomNumber:(int)from to:(int)to;
+(id) getRandomComponent:(NSArray *)components;
+(NSMutableArray *) getRandom:(int)num numbersOutOf:(int)range;

@end

//
//  Cell.h
//  DNA
//
//  Created by Ihor Bodnar on 11/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (nonatomic, strong) NSMutableArray *DNA;

+(NSArray *)dnaCodes;
+(NSString *)getRandomCode;
+(NSString *)getRandomCode:(NSString *)exclude;

-(id) init;
-(int) hammingDistance:(Cell *)cell;

@end

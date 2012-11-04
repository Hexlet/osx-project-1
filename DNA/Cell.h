//
//  Cell.h
//  DNA
//
//  Created by Mihail Onoprienko on 3.11.12.
//  Copyright (c) 2012 Mihail Onoprienko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

+(NSString*) randomBaseExcept : (NSString*) exception;

-(int) hammingDistance : (Cell*)other;

-(NSString*) DNAasString;

@property NSMutableArray *DNA;

@end

//
//  Cell.h
//  DNA
//
//  Created by Axel on 30.10.12.
//  Copyright (c) 2012 Axel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(void) print;
-(NSInteger) hammingDistance:(Cell*) alienDNA;
+(NSString*) genLatter:(int) charIndex;

@end

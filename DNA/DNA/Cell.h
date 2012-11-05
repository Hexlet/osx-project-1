//
//  Cell.h
//  DNA
//
//  Created by Alexander on 11/3/12.
//  Copyright (c) 2012 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(int) hammingDistance:(Cell*) another;
-(NSString*)fourRandomLetters;

@end

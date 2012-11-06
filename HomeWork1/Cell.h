//
//  Cell.h
//  HomeWork1
//
//  Created by Anton on 05.11.12.
//  Copyright (c) 2012 Anton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(void)print;
-(int)hammingDistance:(Cell *) d;

@end

//
//  Cell.h
//  DNA
//
//  Created by Evgeny on 05.11.12.
//  Copyright (c) 2012 Evgeny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
   
@property NSMutableArray *DNA;
@property NSMutableArray *types;

-(int) hammingDistance:(Cell *) cell;
-(NSString *) findGenNot: (NSString *) current;

@end

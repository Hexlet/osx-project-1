//
//  Cell.h
//  DNA
//
//  Created by Arthur Belous on 05.11.12.
//  Copyright (c) 2012 Arthur Belous. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
 //Member Declaretion
   @property NSMutableArray *DNA;

//Method Definition
-(id) init;
-(int) hammingDistance :(Cell*) myCell;

@end

//
//  Cell.h
//  DNA
//
//  Created by Vadim Yazvinskiy on 11/4/12.
//  Copyright (c) 2012 Vadim Yazvinskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray * DNA;

-(void) print;
-(int) hammingDistance: (Cell *) anotherCell;

@end

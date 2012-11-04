//
//  Cell.h
//  DNK
//
//  Created by someone on 11/1/12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA;

-(int) hammingDistance: (Cell *) anotherDNA;
-(NSString *) generateGen;
-(void) print;

@end

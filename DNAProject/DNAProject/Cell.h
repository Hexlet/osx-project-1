//
//  Cell.h
//  DNA
//
//  Created by Rudometov on 11/6/12.
//  Copyright (c) 2012 Rudometov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray* DNA;
}

-(int) hammingDistance: (Cell*) cell;
-(NSString*) getRandomValue;
-(NSString*) getRandomValueExcept: (NSString*) exceptValue;
-(NSString*) toString;

@end
//
//  Cell.h
//  DNA
//
//  Created by Vlad on 03.11.12.
//  Copyright (c) 2012 Vlad. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NUMBER_OF_ELEMENTS 100

@interface Cell : NSObject

@property (nonatomic,readonly) NSMutableArray *DNA;

-(NSString *) generateRandomGen;
-(int) hammingDistance:(Cell *) anotherCell;

@end

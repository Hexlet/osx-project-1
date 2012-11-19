//
//  Cell.h
//  DNA
//
//  Created by Vitaly Dyachkov on 11/4/12.
//  Copyright (c) 2012 Vitaly Dyachkov. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LENGTH_OF_DNA 100

@interface Cell : NSObject

@property (strong) NSMutableArray *DNA;

- (int)hammingDistance:(Cell*)cellForComparsion;

@end

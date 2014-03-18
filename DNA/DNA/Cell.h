//
//  Cell.h
//  DNA
//
//  Created by Алексей Потемкин on 13.11.12.
//  Copyright (c) 2012 Алексей Потемкин. All rights reserved.
//

#include <stdlib.h>

#import <Foundation/Foundation.h>


@interface Cell : NSObject

@property (nonatomic, strong) NSMutableArray *DNA;
@property (nonatomic, strong) NSArray *characters; // Characters for DNA array

-(int)hammingDistance:(Cell *)cell;

@end

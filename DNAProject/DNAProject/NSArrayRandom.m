//
//  NSArrayRandom.m
//  DNAProject
//
//  Created by Alex Nureev on 11/9/12.
//  Copyright (c) 2012 Alex Nureev. All rights reserved.
//

#import "NSArrayRandom.h"

@implementation NSArray (Random)
    -(id) getRandomObject {
        return [self objectAtIndex:arc4random_uniform([self count])];
}
@end
//
//  NSArray+GetRandomObject.m
//  DNK
//
//  Created by Rybalko Dmitriy on 30.10.12.
//  Copyright (c) 2012 Rybalko Dmitriy. All rights reserved.
//

#import "NSArray+GetRandomObject.h"

@implementation NSArray (GetRandomObjectGetter)

- (id)getRandomObject {
    
    if (self.count < 1) {
        return nil;
    }
    
    NSUInteger randomIndex = arc4random() % [self count];
    
    return [self objectAtIndex: randomIndex];
}

@end

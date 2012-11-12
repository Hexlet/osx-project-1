//
//  Cell.m
//  DNK
//
//  Created by eldar on 06.11.12.
//  Copyright (c) 2012 eldar. All rights reserved.
//

#import "Cell.h"
#import <Foundation/NSArray.h>

//#include <stdlib.h>

@implementation Cell

//переопределяем init
- (id) init {
    NSArray *arr = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
    self = [super init];
    
    if (self) {
        _DNA = [[NSMutableArray alloc] init];
        for (int i = 0; i < 100; i++) {
            _DNA[i] = arr[arc4random_uniform(4)];
        }
    }
    return self;
}


- (NSString *) description {
    NSString *res = @"";
    for (int i = 0; i < 100; i++) {
        res = [res stringByAppendingString: _DNA[i]];
    }
    
    return res;
}


- (int) hammingDistance : (Cell *) withCell {
    int dist = 0;
    for (int i = 0; i < 100; i++) {
        if ([withCell.DNA[i] isEqualToString: self.DNA[i]] == NO) {
            dist++;
        }
    }
    return dist;
}



//процедура для тестирования
-(id)copyWithZone:(NSZone *)zone

{
    
    Cell *another = [[Cell alloc] init];
    
    another.DNA = [[self DNA] copyWithZone: zone];
    
    return another;
    
}

@end

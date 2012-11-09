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
    int i;
    NSArray *arr = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
    self = [super init];
    
    if (self) {
        _DNA = [[NSMutableArray alloc] init];
        for (i = 0; i < 100; i++) {
            [_DNA addObject:[NSString stringWithFormat:@"%@", arr[arc4random_uniform(4)]]];
            
        }
    }
    return self;
}


- (void) print {
    int i;
    NSString *res;
    res = @"";
    for (i = 0; i < 100; i++) {
        res = [res stringByAppendingString: _DNA[i]];
    }
    
    NSLog(@"%@", res);
}


- (int) hammingDistance : (Cell *) withCell {
    int i, dist;
    NSString *s, *m;
    dist = 0;
    for (i = 0; i < 100; i++) {
        s = self.DNA[i];
        m = withCell.DNA[i];
        if ([m isEqualToString: s] == NO) {
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

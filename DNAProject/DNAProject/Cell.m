//
//  Cell.m
//  DNAProject
//
//  Created by Valery Kharshats on 11/3/12.
//  Copyright (c) 2012 Valery Kharshats. All rights reserved.
//

#import "Cell.h"
#import <stdlib.h>

@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        DNA = [NSMutableArray arrayWithCapacity:100];
    }
    
    for (NSUInteger i = 0; i < 100; i++) {
        NSUInteger rand = arc4random() % 4;
        [DNA insertObject:[NSString stringWithFormat: @"%li", rand] atIndex: i];
    }
    return self;
    
}
-(void) printArray {
        NSLog(@"%@",DNA);
}

@end

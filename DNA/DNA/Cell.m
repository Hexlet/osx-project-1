//
//  Cell.m
//  DNA
//
//  Created by Evgeny on 05.11.12.
//  Copyright (c) 2012 Evgeny. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        
        //задаем эллементы массива
        NSMutableArray *charsDNA = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil];
        
        
        //задаем размер массива
        _DNA = [NSMutableArray arrayWithCapacity:100];
        
        for (int count=0; count<100; count++) {
            int R_andom = random ()%4;
            [_DNA addObject:[charsDNA objectAtIndex:R_andom]];
        }
    }
    return self;
}
-(void) print {
    NSLog(@"%@", _DNA);
}

@end

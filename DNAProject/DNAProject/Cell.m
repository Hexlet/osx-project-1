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
        switch (rand) {
            case 0:
                [DNA insertObject:@"A" atIndex: i];
                break;
                
            case 1:
                [DNA insertObject:@"T" atIndex: i];
                break;
                
            case 2:
                [DNA insertObject:@"G" atIndex: i];
                break;
                
            case 3:
                [DNA insertObject:@"C" atIndex: i];
                break;
                
            default:
                break;
        }
    }
    return self;
    
}
-(void) printArray {
        NSLog(@"%@",DNA);
}

@end

//
//  Cell.m
//  DNAProject
//
//  Created by Valery Kharshats on 11/3/12.
//  Copyright (c) 2012 Valery Kharshats. All rights reserved.
//

#import "Cell.h"
#import <stdlib.h>
#define DNA_LENGTH 100
@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        _DNA = [NSMutableArray arrayWithCapacity:DNA_LENGTH];
    }
    
    for (NSUInteger i = 0; i < DNA_LENGTH; i++) {
        [_DNA insertObject:[self generateElement] atIndex: i];
    }
    return self;
    
}

-(void) printArray {
    NSLog(@"%@",_DNA);
}

-(NSMutableArray*) getArray {
    return _DNA;
}

-(NSString*) generateElement {
    NSUInteger rand = arc4random() % 4;
    switch (rand) {
        case 0:
            return @"A";
            break;
            
        case 1:
            return @"T";
            break;
            
        case 2:
            return @"G";
            break;
            
        case 3:
            return @"C";
            break;
            
        default:
            return @"";
            break;
    }
}

-(int) hammingDistance: (Cell*) c {
    int result = 0;
    NSMutableArray *compareWith = [c getArray];
    for (int i = 0; i < DNA_LENGTH; i++) {
        id element1 = [_DNA objectAtIndex: i];
        id element2 =[compareWith objectAtIndex: i];
        if (element1 != element2) {
            result++;
        }
//        NSLog(@"Cell1: %@ Cell2: %@ TotalDistance: %i", element1, element2, result);
    }
    return result;
}

@end

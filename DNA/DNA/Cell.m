//
//  Cell.m
//  DNA
//
//  Created by Axel on 30.10.12.
//  Copyright (c) 2012 Axel. All rights reserved.
//

#import "Cell.h"
#import <stdlib.h>

@implementation Cell
-(id)init{
    self = [super init];
    if(self){
        _DNA = [[NSMutableArray alloc] init];
        _tmpArr = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < 100; i++) {
            [_DNA addObject:[Cell genLatter:arc4random()%3]];
        }
    }
    return self;
}
+(NSString*) genLatter:(int)charIndex{
    NSString *tmp;
    switch (charIndex) {
        case 0:
            tmp = @"A";
            break;
        case 1:
            tmp = @"T";
            break;
        case 2:
            tmp = @"G";
            break;
        case 3:
            tmp = @"C";
        default:
            break;
    }
    return tmp;
}
-(void)print{
    NSLog(@"DNA %@", _DNA);
}
-(NSInteger) hammingDistance:(Cell *)alienDNA{
    NSInteger counter = 0;
    for (int i = 0; i < [self->_DNA hash]; i++) {
        if([self->_DNA objectAtIndex:i] != [alienDNA->_DNA objectAtIndex:i]){
            counter++;
        }
    }
    return counter;
}
@end

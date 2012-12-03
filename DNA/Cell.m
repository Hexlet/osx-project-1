//
//  Cell.m
//  DNA
//
//  Created by Nik on 05.11.12.
//  Copyright (c) 2012 Nik. All rights reserved.
//

#import "Cell.h"

@implementation Cell (mutation)

-(void) mutate:(int)x {
    NSUInteger index = [self.DNA count];
    NSUInteger keyIndex = [self.dnaKeys count];
    NSUInteger dnaIndex;
    NSUInteger dnaKeysIndex;
    NSUInteger i=0;
    NSUInteger p=index*x/100;
    NSMutableIndexSet *indexes = [NSMutableIndexSet indexSet];



        while (i!=p) {
            dnaIndex = arc4random()%index; 
            dnaKeysIndex = arc4random()%keyIndex;  
                    if (![indexes containsIndex:dnaIndex] && [self.DNA objectAtIndex:dnaIndex]!=[self.dnaKeys objectAtIndex:dnaKeysIndex]) {
                    [self.DNA replaceObjectAtIndex:dnaIndex withObject:[self.dnaKeys objectAtIndex:dnaKeysIndex]];
                    [indexes addIndex: dnaIndex]; 
                    i++;
                }
        }
}

 
@end

@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        _dnaKeys = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C", nil]; 
        _DNA = [NSMutableArray arrayWithCapacity:100]; 
        for (int i=0; i<100; i++) {                                             
            NSString *dnaKey = [self.dnaKeys objectAtIndex:arc4random()%4];
            [_DNA insertObject:dnaKey atIndex:i];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)cell {
    int hd = 0;
    for (int i=0; i<100; i++) {
        if ([self.DNA objectAtIndex:i] != [cell.DNA objectAtIndex:i]) {
            hd++;
        }
    }
    return hd;
}

-(void) print  {
    NSLog(@"DNA:%@",_DNA);
}


@end

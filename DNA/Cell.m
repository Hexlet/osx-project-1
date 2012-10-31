//
//  Cell.m
//  DNA
//
//  Created by Max Bazaliy on 31.10.12.
//  Copyright (c) 2012 Max Bazaliy. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init {

    self = [super init];
    if (self) {
        self.DNA = [self fillArray:self.DNA withRandomSymbolsCount:100];
    }
    return self;
}


- (NSMutableArray*)fillArray: (NSArray*)array withRandomSymbolsCount:(int)count {
    
    NSMutableArray* filledArray = [NSMutableArray arrayWithArray:array];
    
    if (count == 0) {
        return filledArray;
    }

    for(int symbol = 0; symbol < count; symbol++)
    {
        int value = arc4random() % 4;
        NSString *symbol = [self symbolForCode:value];
        [filledArray addObject:symbol];
    }
    return filledArray;
}


- (int)hammingDistance: (Cell*)cell {
    int distance = 0;
    
    NSMutableArray *first = [self.DNA mutableCopy];
    NSMutableArray *second = [cell.DNA mutableCopy];
    
    if ([first count] != [second count]) {
        return -1;
    }
    
    for (int i =0; i <[first count] ; i++) {
        NSString *firstSym = first[i];
        NSString *secondSym = second[i];
        
        if (![firstSym isEqualToString:secondSym]) {
            distance++;
       //     NSLog(@"Not match! count = %i", distance);
        }
    }
    
    return distance;
}

- (NSString*)symbolForCode: (int)code {
    switch (code) {
        case 0:
            return @"A";
        case 1:
            return @"T";
        break;
        case 2:
            return @"G";
            break;
        case 3:
            return @"C";
            break;
    }
    return @"Bad symbol";
}

@end

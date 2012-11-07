//
//  Cell.m
//  DNA
//
//  Created by A ... on 11/6/12.
//  Copyright (c) 2012 check-engine. All rights reserved.
//

#import "Cell.h"

@implementation Cell {
    NSMutableArray *DNA;
}

-(id) init {
    self = [super init];
    DNA = [[NSMutableArray alloc] init];
    NSString* s;
    int j;
    // при инициализации заполняем массив случайными данными
    for (int i = 0; i < 100; i++) {
        j = random() % 4;
        s = [Cell getDNACodeByNumber:j];
        [DNA addObject:s];
    }
    return self;
}

-(id) init:(Cell *)cell {
    self = [super init];
    DNA = [[NSMutableArray alloc] init];
    for (int i = 0; i < 100; i++) {
        [DNA addObject:[cell getDNACodeAtIndex:i]];
    }
    return self;
}

+(NSString*)getDNACodeByNumber:(int)number {
    if (number == 0) {
        return @"A";
    } else if (number == 1) {
        return @"T";
    } else if (number ==2) {
        return @"C";
    } else {
        return @"G";
    }
}

-(void)print {
    NSString* s = [[NSString alloc] init];
    for (int i = 0; i < 100; i++) {
        s = [s stringByAppendingString: [DNA objectAtIndex:i]];
    }
    NSLog(@"%@",s);
}

-(NSString*)getDNACodeAtIndex:(int)index {
    return [DNA objectAtIndex:index];
}

-(void)setDNACode:(NSString*)code AtIndex:(int)index {
    [DNA replaceObjectAtIndex:index withObject:code];
}

-(int)hammingDistance:(Cell *)toCell {
    int distance = 0;
    for (int i = 0; i < 100; i++) {
        if ([DNA objectAtIndex:i] != [toCell getDNACodeAtIndex:i]) {
            distance++;
        }
    }
    return distance;
}

@end

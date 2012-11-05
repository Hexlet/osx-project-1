//
//  Cell.m
//  osx-project-1
//
//  Created by Роман Евсеев on 05.11.12.
//  Copyright (c) 2012 Роман Евсеев. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id) init {
    if (self = [super init]) {
        _DNA = [[NSMutableArray alloc] init];
        for (int i=0; i<DNA_SIZE; i++) {
            [_DNA addObject:[Cell randomElement]];
        }
    }
    return self;
}

- (NSString *)toString {
    NSString * s = @"";
    for (int i=0; i<DNA_SIZE; i++) {
        s = [s stringByAppendingString:[_DNA objectAtIndex:i]];
    }
    return s;
}

- (int) hammingDistance:(Cell *)cell {
    int diffCount = 0;
#ifdef DEBUG
    NSString * difference = @"";
#endif
    
    for (int i=0; i<DNA_SIZE; i++) {
        if ([_DNA objectAtIndex:i] != [cell.DNA objectAtIndex:i]) {
            diffCount++;
#ifdef DEBUG
            difference = [difference stringByAppendingString:@"^"];
#endif
        }
#ifdef DEBUG
        else {
            difference = [difference stringByAppendingString:@" "];
        }
#endif
    }
#ifdef DEBUG
    NSLog(@"\n%@\n%@\n%@\n", [self toString],[cell toString],difference);
#endif
    return diffCount;
}

+ (NSArray *)getElements {
    return [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
}

+ (NSString *)randomElement {
    NSArray * elements = [Cell getElements];
    return [elements objectAtIndex:arc4random() % [elements count]];
}

+ (NSString *)randomElementWithout:(NSString *)element {
    NSMutableArray * elements = [NSMutableArray arrayWithArray:[Cell getElements]];
    if ([elements containsObject:element]) {
        [elements removeObject:element];
    }
    return [elements objectAtIndex: arc4random() % [elements count]];
}
@end

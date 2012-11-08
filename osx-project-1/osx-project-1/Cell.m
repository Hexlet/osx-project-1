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
        DNA = [[NSMutableArray alloc] init];
        for (int i=0; i<DNA_SIZE; i++) {
            [DNA addObject:[Cell randomElementWithout:@""]];
        }
    }
    return self;
}

- (NSString *)description {
    return [DNA componentsJoinedByString:@""];
}

- (int) hammingDistance:(Cell *)cell {
    int diffCount = 0;
#ifdef DEBUG
    NSString * difference = @"";
#endif
    
    for (int i=0; i<DNA_SIZE; i++) {
        if ([DNA objectAtIndex:i] != [cell.DNA objectAtIndex:i]) {
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
    NSLog(@"\n%@\n%@\n%@\n", self, cell, difference);
#endif
    return diffCount;
}

-(NSMutableArray *)DNA {
    return [NSArray arrayWithArray:DNA];
}

+ (NSArray *)getElements {
    return [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
}

+ (NSString *)randomElementWithout:(NSString *)element {
    NSMutableArray * elements = [NSMutableArray arrayWithArray:[Cell getElements]];
    if ([elements containsObject:element]) {
        [elements removeObject:element];
    }
    return [elements objectAtIndex: arc4random() % [elements count]];
}
@end

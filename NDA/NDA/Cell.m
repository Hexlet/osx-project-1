//
//  Cell.m
//  NDA
//
//  Created by Tsyganov Stanislav on 12.11.12.
//  Copyright (c) 2012 Tsyganov Stanislav. All rights reserved.
//

#import "Cell.h"

@implementation Cell
@synthesize DNA = _DNA;
-(id)init{
    self = [super init];
    if (self) {
        _DNA = [NSMutableArray arrayWithCapacity:kDnaLength];
        NSArray *dnaSymbols = [NSArray arrayWithObjects:@"A", @"T", @"G", @"C", nil];
        for(int i=0; i<kDnaLength; i++){
            [_DNA addObject:[dnaSymbols objectAtIndex: arc4random_uniform(4)]];
        }
    }
    return self;
}

-(int)hammingDistance:(Cell *)anotherCell{
    int answer = 0;
    for (int i = 0; i < kDnaLength; i++) {
        if (![[_DNA objectAtIndex:i] isEqual:[anotherCell.DNA objectAtIndex:i]]) {
            answer++;
        }
    }
    return answer;
}

- (NSString *)description{
    NSMutableString* descString = [[NSMutableString alloc] init];
    for (int i = 0; i < kDnaLength; i++) {
        [descString appendString:[_DNA objectAtIndex:i]];
    }
    return [NSString stringWithString:descString];
}

@end

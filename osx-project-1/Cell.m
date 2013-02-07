//
//  Cell.m
//  osx-project-1
//
//  Created by Andrey Shindarev on 07.02.13.
//  Copyright (c) 2013 Andrey Shindarev. All rights reserved.
//

#import "Cell.h"
#import <stdlib.h>

@implementation Cell

static NSString *dnaElements[4] = {@"A",@"T",@"G",@"C"};
static int       dnaElementsCnt = sizeof dnaElements/sizeof(NSString*);

- (id) init {
    return [self initWithSize: 100];
}

- (id) initWithSize: (int) size {
    self = [super init];
    size = MAX(1,size);
    _DNA = [NSMutableArray arrayWithCapacity: size];
    for (int i = 0; i < size; i++) {
        NSString *val = [Cell getRandomElement: (NSString*)nil];
        [_DNA addObject: val];
    }
    return self;
}

-(int) hammingDistance:(Cell*) withCell {
    int size = (int)[_DNA count];
    int withSize = (int)[[withCell DNA] count];
    int result = abs(size - withSize);
    int cnt    = MIN(size, withSize);
    for (int i=0; i < cnt; i++) {
        if (![[_DNA  objectAtIndex:i] isEqualToString: [[withCell DNA] objectAtIndex:i]]) {
            result++;
        }
    }
    return result;
}

+(NSString*) getRandomElement: (NSString*) exceptElement {
    NSString* element = dnaElements[arc4random() % dnaElementsCnt];
    if ([element isEqualToString: exceptElement]) {
        return [Cell getRandomElement: exceptElement];
    } else {
        return element;
    }
}

@end

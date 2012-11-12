//
//  Cell.m
//  prj1-DNA
//
//  Created by void on 12.11.12.
//  Copyright (c) 2012 void. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init {
    
    if (self = [super init]) {
        _DNA = [NSMutableArray arrayWithCapacity:100];
        _Gen = [NSArray arrayWithObjects: @"A", @"T", @"G", @"C", nil];
        [self filling:[self crInd]];
    }
    return self;
}
//
- (void)filling:(NSMutableArray*)ind {
    
    NSString *changing;
    
    for (int i = 0; i < ind.count; i++) {
        int pos = [[ind objectAtIndex:i] intValue];
        do {
            changing = self.getIntRand;
        } while ([_DNA count] > pos && changing == [_DNA objectAtIndex:pos]);
        
        [_DNA setObject:changing atIndexedSubscript:pos];
    }
}

//
- (NSMutableArray*)crInd {
    NSMutableArray *ind = [NSMutableArray arrayWithCapacity:100];
    
    for (int i = 0; i < 100; i++) {
        [ind addObject:[NSNumber numberWithInt:i]];
    }
    return ind;
}


- (NSString*) getIntRand {
    int r = arc4random_uniform((uint)_Gen.count);
    return [_Gen objectAtIndex: r];
}


- (int)hammingDistance:(Cell *)comp {
    int diff= 0;
    
    for (int i = 0; i < _DNA.count; i++) {
        if ([_DNA objectAtIndex:i] != [comp.DNA objectAtIndex:i]) {
            diff++;
        }
    }
    return diff;
}



-(void) print {
    NSLog(@"%@", _DNA);
}


@end

//
//  Cell.m
//  HexletCell
//
//  Created by Артем Прохоров on 06.11.12.
//  Copyright (c) 2012 Артем Прохоров. All rights reserved.
//

#include <stdlib.h>
#import "Cell.h"

@implementation Cell
@synthesize DNA;

-(id)init {
    self = [super init];
    DNA = [NSMutableArray arrayWithCapacity:100];
    for (int i = 0; i < 100; i++) {
        NSString * DNAMark = [self getRandomDNAMark];
        [DNA addObject:DNAMark];
    }
    return self;
}

-(NSString *) getRandomDNAMark {
    int j = arc4random() % 4;
    NSString * DNAMark;
    if (j == 0) {
        DNAMark = @"A";
    }
    else if (j == 1) {
        DNAMark = @"T";
    }
    else if (j == 2) {
        DNAMark = @"G";
    }
    else {
        DNAMark = @"C";
    }
    return DNAMark;
}

-(int) hammingDistance:(Cell *)cell {
    int hammingDistance = 0;
    for (int i = 0; i < [DNA count]; i++) {
        if ([DNA objectAtIndex:i] != [cell.DNA objectAtIndex:i]) {
            hammingDistance++;
        }
    }
    return hammingDistance;
}

-(void) print {
    for (int i = 0; i<[DNA count]; i++) {
        NSLog(@"Count = %lu", [DNA count]);
        NSLog(@"%@", DNA);
    }
}

@end

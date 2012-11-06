//
//  Cell.m
//  1prj-deenka
//
//  Created by Wladi on 05.11.12.
//  Copyright (c) 2012 noorg. All rights reserved.
//

#import "Cell.h"

@implementation Cell {
    NSMutableArray *DNA;
    NSString *DNA_bases;
    int i, j;
}

// свой init
-(id) init {
    
    self = [super init];
    if (self) {
        
        DNA_bases = @"ATGC";
        DNA = [[NSMutableArray alloc] initWithCapacity:10];
        for (i=0; i<10; i++) {
            j=(random()%5);
            [DNA addObject:[NSString stringWithFormat:@"%c",[DNA_bases characterAtIndex:j ]]];
        }
        

    }
    return self;
}


- (int) hammingDistance: (Cell*) cell {

    return 0;
}


- (void) print {
    NSLog (@"%@", DNA_bases);
    NSLog (@"%@", [DNA objectAtIndex:1]);
}

@end

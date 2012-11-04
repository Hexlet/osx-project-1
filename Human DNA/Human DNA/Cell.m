//
//  Cell.m
//  Human DNA
//
//  Created by Dmitry Marenich on 11/4/12.
//  Copyright (c) 2012 Dmitry Marenich. All rights reserved.
//

#import "Cell.h"


@implementation Cell {
    
    NSMutableArray *DNA;
    NSArray *arrayOfChars;
}

// Inititalize array 'humanDNA'
-(id) init {
    self = [super init];
    if (self) {
            int countR = 0;
            NSString *a = @"A";
            NSString *t = @"T";
            NSString *g = @"G";
            NSString *c = @"C";
            arrayOfChars = [[NSArray alloc] initWithObjects:a,t,g,c,nil];
            NSLog(@"%@", arrayOfChars);
        
            NSMutableArray *humanDNA = [[NSMutableArray alloc] initWithArray:(arrayOfChars)];
            for (int i=0; i<=100; i++) {
                countR = random() % 4;
                [[humanDNA insertObjects:[[NSArray arrayOfChars[countR] atIndex:i]]];
            }
            NSLog(@"%@", humanDNA);
            return self;
    }
}
                 
// Mutation of DNA
- (void) mutator:(int) percentOfSymbols {
    if (percentOfSymbols > 100 && percentOfSymbols < 0) {
        NSLog(@"Error!");
    return;
    }
}
@end

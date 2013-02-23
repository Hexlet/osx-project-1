//
//  Cell.m
//  aproDNA
//
//  Created by apro on 07.01.13.
//  Copyright (c) 2013 apro. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        letter = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
        DNA = [[NSMutableArray alloc] init];
        for (i=0; i<=99; i++) {
            randomNumber = (random() % 4);
            [DNA addObject:[letter objectAtIndex:random() % 4]];
        }
    }
    return self;
}

-(void) print{
    NSLog(@"%@", DNA);
}

-(int) hammingDistance: (Cell *) DNA2 {
    hD = 0;
    for (i = 0; i<=99; i++) {
        if ([DNA objectAtIndex:i] != [[DNA2 getDNA] objectAtIndex:i]) {
            hD++;
        }
    }
    return hD;
}
    
-(NSMutableArray *) getDNA{
    return DNA;
}


@end

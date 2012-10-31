//
//  Cell.m
//  DNA
//
//  Created by Dastar Ron on 10/31/12.
//  Copyright (c) 2012 Dastar Ron. All rights reserved.
//

#import "Cell.h"

@implementation Cell {
    NSMutableArray *DNA;
}

-(id) init {
    self = [super init];
    if (self) {
        //Create an DNA array with 100 chars.
        //There is just 4 possible chars: a, t, g and c.
        DNA = [[NSMutableArray alloc] init];
        int a;
        for (int i=0; i<100; i++) {
            a = (int)1 + arc4random() % (4);
            if (a == 1)
                [DNA addObject:@"A"];
            else if (a == 2)
                [DNA addObject:@"T"];
            else if (a == 3)
                [DNA addObject:@"G"];
            else
                [DNA addObject:@"C"];
        }
    }
    return self;
}

-(void) print {
    //Print all the DNA code;
    NSLog(@"[%@]", [DNA componentsJoinedByString:@","]);
}

-(NSMutableArray *) getDNA{
    return DNA; 
}

-(int) hammingDistance: (Cell *)fromDNA {
    int hamming = 0;
    if (![DNA isEqualToArray:[fromDNA getDNA]]){
        for (int i = 0; i < 100; i++) {
            if ([DNA objectAtIndex:i] != [[fromDNA getDNA] objectAtIndex:i])
                hamming++;
        }
    }
    return hamming;
}

-(void) replaceWith:(Cell *)array {
    [DNA removeAllObjects];
    [DNA addObjectsFromArray:[array getDNA]];
}

@end

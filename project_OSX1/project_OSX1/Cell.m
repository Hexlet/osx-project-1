//
//  Cell.m
//  project_OSX1
//
//  Created by Sergey on 31.10.12.
//  Copyright (c) 2012 Sergey. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id)init{
    self = [super init];
    if (self){
        _dna = [NSMutableArray arrayWithCapacity:100];
        for (int i=0; i<100; i++){
            int rand_letter;
            rand_letter = arc4random() % 4;
            if (rand_letter == 0){
                [_dna addObject:@"A"];
            }
            if (rand_letter == 1){
                [_dna addObject:@"T"];
            }
            if (rand_letter == 2){
                [_dna addObject:@"G"];
            }
            if (rand_letter == 3){
                [_dna addObject:@"C"];
            }
         }
    }
    return self;
}


-(int) hammingDistance:(Cell*) d{
    int total;
    total = 0;
    for (int i=0; i<100; i++){
        if (![[self.dna objectAtIndex:i] isEqual:[d objectAtIndex:i]]{
            total++;
        }
    }
    return total;
}

@end

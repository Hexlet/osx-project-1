//
//  Cell.m
//  Gurin_DNA
//
//  Created by Admin on 11/7/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import "Cell.h"
#import "stdlib.h"

@implementation Cell
-(id) init{
    self = [super init];
    if(self){
        dna = [[NSMutableArray alloc] initWithCapacity:100];
        int r;
        NSArray *arr = [NSArray arrayWithObjects:[NSValue valueWithBytes:"A" objCType:@encode(char)],
                                                 [NSValue valueWithBytes:"T" objCType:@encode(char)],
                                                 [NSValue valueWithBytes:"G" objCType:@encode(char)],
                                                 [NSValue valueWithBytes:"C" objCType:@encode(char)],nil];
        for(NSInteger i = 0; i<100;i++)
        {
            r = arc4random()%4;
            [dna addObject:[arr objectAtIndex:r]];
        }
    }
    return self;
}

-(void)printDNA{
    if(dna) {
        char ch;
        for (NSValue *val in dna){
            [val getValue:&ch];
            NSLog(@"value %c", ch);
        }
    }
}

-(int)hammingDistance:(Cell *)second_dna{
    int distance = 0;
    for(int i = 0; i<100;i++){
        if(![[dna objectAtIndex:i] isEqualToValue:[second_dna->dna objectAtIndex:i]]) distance++;
    }
    return distance;
}

@end

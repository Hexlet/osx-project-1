//
//  Cell+mutate.m
//  DNA
//
//  Created by Администратор on 11/6/12.
//  Copyright (c) 2012 Администратор. All rights reserved.
//

#import "Cell+mutate.h"

@implementation Cell (mutate)

-(void) mutate:(int)p {
    if(p > 100 || p < 1) {
        NSLog(@"Процентов должно быть больше 0 и меньше 100!");
        exit(0);
    }
    int x = floor(([[self DNA] count] * p) / 100);
    //NSLog(@"%d",x);
    int indexes[x];
    bool new;
    NSArray *cDNA = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
    for(int i = 0; i<x; i++) {
        
        while(true) {
            indexes[i] = arc4random()%100;
            new = true;
            for(int j = 0; j<i; j++) {
                if(indexes[j] == indexes[i]) {
                    new = false;
                    break;
                }
            }
            if(new) {
                break;
            }
        }
    }
    
    for(int i = 0; i<x; i++) {
        [[self DNA] replaceObjectAtIndex:indexes[i] withObject:[cDNA objectAtIndex:arc4random()%4]];
    }
}

@end

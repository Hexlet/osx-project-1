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
        NSLog(@"Процентов должно быть больше 0 и меньше 100! А у вас почему то %i%%", p);
        exit(0);
    }
    
    int x = floor(([[self DNA] count] * p) / 100);
    
    NSMutableArray *copyDNA = [NSMutableArray arrayWithArray:self.DNA];
    self.idx = [NSMutableArray arrayWithCapacity:x];
    
    int i = 0;
    int rnd = [self next];
        
    while(i<x) {
        [[self DNA] replaceObjectAtIndex:rnd withObject:[[self cDNA] objectAtIndex:arc4random()%4]];
        if([[[self DNA] objectAtIndex:rnd] isNotEqualTo:[copyDNA objectAtIndex:rnd]]) {
            //NSLog(@"%@ . %@ . %i", [self.DNA objectAtIndex:rnd], [copyDNA objectAtIndex:rnd], rnd);
            rnd = [self next];
            i++;
            
        }
    }
    
    //NSLog(@"%i",i);
}

-(int) next {
    int i = arc4random()%[self.DNA count];
    while([self.idx containsObject:[NSNumber numberWithInt:i]]) {
        i = arc4random()%[self.DNA count];
        //NSLog(@"%i . %i", i, [self.idx count]);
    }
    [self.idx addObject:[NSNumber numberWithInt:i]];
    return [[self.idx lastObject] intValue];
}

@end

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
    //NSLog(@"%d",x);
    NSMutableArray *copyDNA = [self DNA]; // копия днк
    int i = 0;
    int rnd = arc4random()%[self.DNA count];
    
    while(i<x) {
        [[self DNA] replaceObjectAtIndex:rnd withObject:[[self cDNA] objectAtIndex:arc4random()%4]];
        // почему то строка выше не заменяет элемент в массиве,
        // в итоге все это приводит к бесконечному цыклу
        if([[[self DNA] objectAtIndex:rnd] isNotEqualTo:[copyDNA objectAtIndex:rnd]]) {
            rnd = arc4random()%[self.DNA count];
            i++;
        }
        //NSLog(@"%@ %@ %@",[[self DNA] objectAtIndex:rnd], [copyDNA objectAtIndex:rnd], [[self cDNA] objectAtIndex:arc4random()%4]);

    }
    //printf("%i\n\n", i);
}

@end

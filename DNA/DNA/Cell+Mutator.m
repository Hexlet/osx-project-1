//
//  Cell+Mutator.m
//  DNA
//
//  Created by Kirill Ragozin on 10 / 31 / 12.
//  Copyright (c) 2012 Kirill Ragozin. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell (Mutator)
-(void)mutate:(int)X{
    if (X>0) {
        if (X>DNA.count) X=(int)DNA.count;
        X = round(X*CAPACITY/100);

        // infect
        NSMutableArray *infected = [NSMutableArray arrayWithCapacity:X];
        NSUInteger index = arc4random() % X;
        while (infected.count < X) {
            if (![infected containsObject:[NSNumber numberWithInteger:index]]){
                [infected addObject:[NSNumber numberWithInteger:index]];
            }
            index = arc4random() % X;
        }
        
        NSMutableArray *mutation = [NSMutableArray arrayWithArray:infected];
        for (int i=0; i<mutation.count; i++) {
            int j = (arc4random() % (mutation.count - i)) + i;
            [mutation exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
        
        // mutate
        NSMutableArray *mutated = [NSMutableArray arrayWithCapacity:X];
        for (id item in mutation){
            NSUInteger index = [item integerValue];
            [mutated setObject:[DNA objectAtIndex:index] atIndexedSubscript:[mutation indexOfObject:item]];
        }
    
        for (int i=0; i<DNA.count; i++){
            NSNumber *num = [NSNumber numberWithInteger:i];
            if ([infected containsObject:num]){
                index = [infected indexOfObject:num];
                [DNA setObject:[mutated objectAtIndex:index] atIndexedSubscript:i];
            }
        }

    }
}
@end

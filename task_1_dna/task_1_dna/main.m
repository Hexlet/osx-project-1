//
//  main.m
//  task_1_dna
//
//  Created by Sergey Sh on 05.11.12.
//  Copyright (c) 2012 Sergey Sh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *dna1;
        Cell *dna2;
        
        int distance;
        int percentOfMutation;
        
        dna1 = [[Cell alloc] init];
        dna2 = [[Cell alloc] init];
        
        dna1.count = 100;
        dna2.count = 100;
        
        percentOfMutation = 30;
        
        [dna1 createDNA];
        [dna2 createDNA];
        
        distance = [dna1 hammingDistance: dna2];
        
        // insert code here...
        if (distance >= 0) {
            NSLog(@"DNA 1: %@", [dna1 getDNAString]);
            NSLog(@"DNA 2: %@", [dna2 getDNAString]);
            NSLog(@"Distance: %i", distance);
            
            [dna2 mutate: percentOfMutation];
            // дистанция после мутации
            distance = [dna1 hammingDistance: dna2];
            
            NSLog(@"DNA 1: %@", [dna1 getDNAString]);
            NSLog(@"DNA 2: %@", [dna2 getDNAString]);
            NSLog(@"Distance: %i", distance);
        
        } else {
            NSLog(@"Error!!! DNA has not equals length!!!");
        }
        
        
    }
    return 0;
}


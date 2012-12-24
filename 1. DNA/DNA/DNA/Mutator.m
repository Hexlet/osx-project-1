//
//  Mutator.m
//  DNA
//
//  Created by Elena Grasovskaya on 12/24/12.
//  Copyright (c) 2012 Sergey Grasovskiy. All rights reserved.
//

#import "Mutator.h"

@implementation Cell (Mutator)


-(void)mutatorAtProcent:(int)procent
{
    NSArray * copyDNA = [dna copy]; //копируем днк как "шаблон для сверки"
    int position=0;
    int index=0;
    
    NSLog(@"Mutate %@ ... %i%%",self.name,procent);
    
    while(procent)
    {
        position = (int) random() %100;
        index = (int)random() %4;
        
        // мутирует лишь та часть, которая не соответсвует "шаблону для сверки"
        
        if([dna objectAtIndex:position] == [copyDNA objectAtIndex:position])
            if([dna objectAtIndex:position]!=[arNukl objectAtIndex:index] )
            {
                [dna setObject:[arNukl objectAtIndex:index] atIndexedSubscript:position];
                --procent;
            }
    }
   
    /*
     int mutaneCount = 1;
     for (int i=0; i<self.capacity; i++)
     {
     if([dna objectAtIndex:i] == [copyDNA objectAtIndex:i])
     NSLog(@"%@ | %@",[dna objectAtIndex:i], copyDNA[i]);
     else
     NSLog(@"%@ | %@  --- mutate %i",[dna objectAtIndex:i], copyDNA[i], mutaneCount++);
     }
     */
}
@end

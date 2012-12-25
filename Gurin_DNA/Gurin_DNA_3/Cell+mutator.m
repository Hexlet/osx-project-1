//
//  Cell+mutate.m
//  Gurin_DNA_3
//
//  Created by Admin on 11/8/12.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void)mutate:(int)mutant{
    if(mutant>100) mutant=100;
    if(mutant<0) mutant=0;
    NSArray *arr = [NSArray arrayWithObjects:[NSValue valueWithBytes:"A" objCType:@encode(char)],
                    [NSValue valueWithBytes:"T" objCType:@encode(char)],
                    [NSValue valueWithBytes:"G" objCType:@encode(char)],
                    [NSValue valueWithBytes:"C" objCType:@encode(char)],nil];
    int cnt = [dna count]/100*mutant;
    int rand, r_arr;
    NSMutableArray* mutated = [NSMutableArray new];
    
    for(int i = 0; i<cnt; i++){
        while(true){
            rand = arc4random()%[dna count];
            if([mutated containsObject:[[NSNumber alloc] initWithInt:rand]])
                continue;
            r_arr = arc4random()%4;
            [dna replaceObjectAtIndex:rand withObject:[arr objectAtIndex:r_arr]];
            [mutated addObject:[[NSNumber alloc] initWithInt:rand]];
            break;
        }
    }
}

@end

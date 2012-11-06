//
//  Cell+mutator.m
//  DNA1
//
//  Created by Dmitry on 11/3/12.
//  Copyright (c) 2012 TechAid Inc. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)

-(void)mutate:(int)percent{
    
    if (percent<0) {percent=0;}
    if (percent>100) {percent=100;}
    
    int random_index, rand;
    NSString *dna_element;// = [[NSString alloc] init];
    NSMutableString *dna_mutated_element;// = [[NSMutableString alloc] init];
    NSMutableArray *indexes_array = [[NSMutableArray alloc] init]; //used to get random indexes for dna
    
    for (int i=0; i<100; i++) {
        [indexes_array addObject:[[NSNumber alloc] initWithInt:i]];
    }
    [indexes_array shuffle];
    for (int i=0; i<percent; i++) {
        random_index = [[indexes_array objectAtIndex:i] intValue];
        dna_element = [DNA objectAtIndex:random_index];
        //NSLog(@"will mutate=%@,%i",dna_element, random_index);
        rand = arc4random() % 4;
        dna_mutated_element = [[NSMutableString alloc] init];
        [dna_mutated_element setString:[[dict substringFromIndex:rand] substringToIndex:1]];
        
        while ( [dna_element isEqualToString:dna_mutated_element] ==YES ) {
            rand = arc4random() % 4;
            dna_mutated_element = [[NSMutableString alloc] init];
            [dna_mutated_element setString:[[dict substringFromIndex:rand] substringToIndex:1]];
            //NSLog(@"random=%@,%i",dna_mutated_element, random_index);
        }
        [DNA replaceObjectAtIndex:random_index withObject:dna_mutated_element];
        NSLog(@"Mutation: element %i from %@ to %@",random_index, dna_element,dna_mutated_element);
    }
    [self buildDNAString];
    
}

@end


@implementation NSMutableArray (Shuffling)
-(void)shuffle{
    NSUInteger count = [self count];
    for (NSInteger i=0; i < count; ++i){
    //Select a random element between i and and of array to soap with.
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) +i;
        [self exchangeObjectAtIndex:i  withObjectAtIndex:n];
    }
}
@end
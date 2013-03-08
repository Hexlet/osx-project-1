//
//  cell.m
//  dna_1
//
//  Created by Partisan on 07.03.13.
//  Copyright (c) 2013 partisan. All rights reserved.
//

#import "Cell.h"

@implementation Cell{
    NSMutableArray * dna;
    NSArray * posibleGene;
    int chromosomesAmt;
    unsigned long seed;
    
}

-(id)init{
    self = [super init];
    chromosomesAmt = 100;
    
    posibleGene = [[NSArray alloc] initWithObjects:@"A", @"T", @"G", @"C", nil ];
    seed = [posibleGene count];
    
    if (self){
        dna = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < chromosomesAmt; i++){
            
            [dna addObject:[posibleGene objectAtIndex:(arc4random() % seed)]];
            
        }
            
    }
    return self;
}
-(void)print{
    
    NSLog(@"%@ ", [self getDNA]);
}
-(int)hammingDistance:(Cell *) c{
    int result=0;
    for (int i = 0; i < chromosomesAmt; i++){
        if ( [self getGeneAtIndex:i] != [c getGeneAtIndex:i])
            result++;
    }    
    return result;
}

-(id)getGeneAtIndex: (unsigned int) index{ // гетер генов
    if (index <= chromosomesAmt)
        return [dna objectAtIndex:index];
    return nil;
}

-(id)getDNA{ // возвращает всю последовательность генов
    NSMutableString * result = [[NSMutableString alloc] init];
    for (id gene in dna)
        [result appendString:gene];
    return result;
}

-(void) setGene:(NSString *)gene AtIndex: (unsigned int) index;{
    [dna setObject:gene atIndexedSubscript:index];
}

@end

@implementation Cell (Mutation)


-(void)mutate: (int) percent{
    percent=percent%100; //на случай если передадут больше 100%
    
    int numberMutGene = chromosomesAmt  * percent / 100;
    id newGene;
    NSMutableArray *uniq = [[NSMutableArray alloc] init];
    int curentlyMutGen = 0;
    
    for (int i = 0; i < numberMutGene; i++){
        
        do{
            curentlyMutGen = arc4random() % chromosomesAmt;
        }while ([uniq doesContain:[self getGeneAtIndex:curentlyMutGen]]);
        
        [uniq addObject:[[NSString alloc] initWithFormat:@"%i", curentlyMutGen, nil ] ];
            do {
                newGene = [posibleGene objectAtIndex:(arc4random() % seed)];
            } while ([self getGeneAtIndex:curentlyMutGen ] == newGene);
            
        
        
        
        [self setGene:newGene AtIndex:curentlyMutGen];
    }
}

@end
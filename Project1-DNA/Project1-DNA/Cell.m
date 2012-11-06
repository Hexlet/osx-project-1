//
//  Cell.m
//  Project1-DNA
//
//  Created by Администратор on 11/4/12.
//  Copyright (c) 2012 Kirill.Muratov. All rights reserved.
//

#import "Cell.h"
#import "CellMutator.h"

@implementation Cell{
    
        NSArray *nucleotides;
    
        NSMutableArray *DNA;
    }

-(int) hammingDistanse: (Cell*) cell{

               if([self isEqual:cell]) return 0;
        
               if(cell == nil) return (int)[DNA count] ;
        
               int count = 0;
    
               NSMutableArray *dna = [cell getDNA];
        
               for (int i = 0; i < [DNA count]; i++) {
                      if (DNA[i] != dna[i]) {
                               count++;
                           }
                   }
        
               return count;
            }

-(id)init {
                self = [super init];
        
                if (self != nil) {
            
                        int DNASize = 100;
                        nucleotides = @[@"G", @"A", @"T", @"D"];
            
                        DNA = [NSMutableArray arrayWithCapacity: DNASize];
            
                        for(int i = 0; i < DNASize; i++){
                                //вернет случайное число в диапазоне [0..[nucleotides count] - 1]
                                int index = arc4random_uniform((int)[nucleotides count]);
                            
                                [DNA addObject: [nucleotides objectAtIndex: index]];
                            }
                    }
                return self;
    }
-(NSMutableArray *) getDNA{
        return [DNA copy];
    };

-(id) getNucleotideAtIndex: (int) index{
        return [DNA objectAtIndex:index];
    };

-(NSArray *) getNucleotides{
        return [nucleotides copy];
    };

@end

@implementation Cell (mutator)

-(void) mutate: (int) percent{
        @autoreleasepool {
               NSMutableArray *indexes = [NSMutableArray arrayWithCapacity:[DNA count]];
                for(int i = 0; i < [DNA count]; i++ ){
                        [indexes addObject: [NSNumber numberWithInt:i]];
                    }
        
                for(int i = 0; i < ([DNA count ] * percent/ 100 ); i++){
            
                        int rnd = arc4random_uniform((int)[indexes count]) % [nucleotides count];
            
                        int index = (int)[[indexes objectAtIndex: rnd] integerValue];
            
                        NSString *val = [DNA objectAtIndex:index];
            
                        NSString *mutant = [self mutateElem: val];
                    
                    
                        [DNA replaceObjectAtIndex:index withObject: mutant];
                    
                        [indexes removeObjectAtIndex:rnd];
                    }
            }
    
    
    };

-(NSString*) mutateElem: (NSString*) elem {
                int index = (int)[nucleotides indexOfObject:elem];
            
                //получаем случайное смещение индекса в диапазоне [1..3]
                int shift = arc4random_uniform((int)[nucleotides count] - 1) + 1; //вернет [0..2] + 1
            
                int newIndex = (int)(index + shift) % [nucleotides count];
            
                return [nucleotides objectAtIndex: newIndex];
    }

@end

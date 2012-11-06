//
//  main.m
//  DNAProject
//
//  Created by VITALIY NESTERENKO on 05.11.12.
//  Copyright (c) 2012 VITALIY NESTERENKO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "main.h"
#import "stdlib.h"



@implementation Cell

-(int) getRandomNumber:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}

// Возвращает последовательность случайных числел в диапазоне [from - to] в количестве count
//
-(void)getRandomSequence:(int)from to:(int)to count:(int)count sequnce:(int *)sequence {
    int new_random_value;
   
    Boolean found;
    
    for (int i = 0; i < count; i++) {
        
        found = YES;
        
        while (found) {
        
            new_random_value = [self getRandomNumber:from to:to];
            found = NO;
            
            for (int j=0; j < count; j++) {
                if (new_random_value == sequence[j])
                    found = YES;
            }
            
        }
        
        
        sequence[i] = new_random_value;
       
    }
    
}

- (NSString *) randomNucleotide {
   NSArray *letters = [[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C",nil];
   return [letters objectAtIndex:  [self getRandomNumber:0 to:3]];
}



- (id) init {
    self = [super init];
    _DNA = [[NSMutableArray alloc] initWithCapacity:100];
    
    for (int i = 0 ; i < 100; i++) {
        
        [_DNA insertObject:[self randomNucleotide] atIndex:i];
    }
    
    
    return self;
}

- (int) hammingDistance:(Cell *)other_cell {
    
    int result = 0;
    
    for (int i = 0; i < 100; i++) {
        
        if ([_DNA objectAtIndex:i] != [other_cell.DNA objectAtIndex:i]){
            result ++;
        }
        
    }
    
    return result;
    
}

-(NSString *) asString {
    
 return [_DNA componentsJoinedByString:@""];
    
}

@end


@implementation Cell (mutator)

- (void) mutate:(int)percent {
    
    int positions_to_change_count = (int)((100 * percent) / 100);
    int positions[positions_to_change_count];
    
    
    [self getRandomSequence:0 to:99 count:positions_to_change_count sequnce:positions];
    
    for (int i = 0; i < positions_to_change_count; i++) {
    
        [_DNA replaceObjectAtIndex:positions[i] withObject:[self randomNucleotide]];
        
    }
    
    
}

@end



int main(int argc, const char * argv[])
{

    @autoreleasepool {

        Cell *cell =[[Cell alloc] init];
        Cell *cell1 =[[Cell alloc] init];

        
        NSLog(@"Hamming distance: %d",[cell hammingDistance:cell1]);
        
        [cell mutate:40];
        
        NSLog(@"After MUTATION: ");
      
        NSLog(@"Hamming distance: %d",[cell hammingDistance:cell1]);
        
        
        
    }
    return 0;
}


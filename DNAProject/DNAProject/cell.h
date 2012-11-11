//
//  cell.h
//  _DNAProject
//
//  Created by VITALIY NESTERENKO on 11.11.12.
//  Copyright (c) 2012 VITALIY NESTERENKO. All rights reserved.
//

#ifndef _DNAProject_cell_h
#define _DNAProject_cell_h

@interface Cell : NSObject

-(int)getRandomNumber:(int)from to:(int)to;
-(void)fillArrayWithRandomSequence:(int)from to:(int)to count:(int)count sequnce:(int *)sequence;


@property NSMutableArray * DNA;

- (NSString *) randomNucleotide;
- (int) hammingDistance:(Cell *)other_cell;
-(NSString *) asString;
@end



@implementation Cell


-(int) getRandomNumber:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}


// Возвращает последовательность случайных числел в диапазоне [from - to] в количестве count
//
-(void)fillArrayWithRandomSequence:(int)from to:(int)to count:(int)count sequnce:(int *)sequence {
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
    NSString *nucleotids[4] = {@"A",@"T",@"G",@"C"};
    return nucleotids[[self getRandomNumber:0 to:3]];
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
        
        if (  ![[_DNA objectAtIndex:i] isEqualToString:[other_cell.DNA objectAtIndex:i] ] ) {
            result ++;
        }
    }
    
    return result;
}


- (void) copyFromOther:(Cell *)other_cell {
    for (int i=0; i<100;i++) {
        [_DNA replaceObjectAtIndex:i withObject: [other_cell.DNA objectAtIndex:i] ];
        
    }
    
}

-(NSString *) asString {
    
    return [_DNA componentsJoinedByString:@""];
    
}

@end



#endif

//
//  main.m
//  DNAproj
//
//  Created by Иван Иванов on 10.11.12.
//  Copyright (c) 2012 Иван Иванов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void)mutate:(int)n;
@end

@implementation Cell (mutator)
-(void)mutate:(int)n{
    
    int k;
    
    NSMutableArray *N = [[NSMutableArray alloc] init];
    [self.wDNA setArray:self.DNA];
    
    for (int i =0; i<100/100*n; i++) {
        k = random()%100;
        
        if ([self.wDNA objectAtIndex:k] != @"x") {
            
            [N setArray: self.wElements];
            [ N removeObject: [[self DNA] objectAtIndex:k ] ];
            [ [self DNA] replaceObjectAtIndex:k withObject:  [N  objectAtIndex: random()%3]  ];
            [self.wDNA replaceObjectAtIndex:k withObject:@"x"];
            
            
        }else {i--;}
        
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
    
        Cell *cell1, *cell2;
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
            
        [cell1.DNA setArray:cell2.DNA];
        [cell1 mutate:78];
        
        NSLog(@"Hamming distance: %d", [cell1 hammingDistance:cell2]);
       
                                        
    }
    return 0;
}


//
//  main.m
//  DNK
//
//  Created by Алексей Виноградов on 06.11.12.
//  Copyright (c) 2012 Алексей Виноградов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
- (void)mutate:(int)mut;

@end

@implementation Cell (mutate)

- (void)mutate:(int)mut{
    
    NSMutableArray *testArr = [NSMutableArray array];
    
    for(int i=1; i<=mut; i++){
        
     int randValue1 = (arc4random() % 100) + 1;
        
        if(![testArr containsObject:[NSNumber numberWithInt:randValue1]]){
            
            int randValue = (arc4random() % 4) + 1;
            //NSLog(@"%d", randValue);
            if (randValue==1){
                
                [self.dnaarr insertObject:@"A" atIndex:randValue1];
                
            }
            
            if (randValue==2){
                
                [self.dnaarr insertObject:@"T" atIndex:randValue1];
                
            }
            
            if (randValue==3){
                
                [self.dnaarr insertObject:@"G" atIndex:randValue1];
                
            }
            
            if (randValue==4){
                
                [self.dnaarr insertObject:@"C" atIndex:randValue1];
                
            }
 
            
            
        }
             else{
                 
                 i--;
                 
             }
             
        [testArr addObject:[NSNumber numberWithInt:randValue1]];
        
        
        
        
        
        
        
        
    }
   // NSLog(@"%@", self.dnaarr);
   // NSLog(@"%@", testArr);
}

@end


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        Cell *dna = [[Cell alloc] init];
        Cell *dna2 = [[Cell alloc] init];
        
       
        
        
        NSLog(@"%d", [dna hammingDistance:dna2]);
        
        [dna mutate:(70)];
        [dna2 mutate:(80)];
        
        NSLog(@"%d", [dna hammingDistance:dna2]);
    }
    return 0;
}


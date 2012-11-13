//
//  main.m
//  Project1-DNA
//
//  Created by Администратор on 11/4/12.
//  Copyright (c) 2012 Kirill.Muratov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "CellMutator.h"



int main(int argc, const char * argv[])
{
    
        @autoreleasepool {
                Cell *cell1 = [[Cell alloc]init];
                Cell *cell2 = [[Cell alloc]init];
        
                NSLog(@"Hamming distance before mutation %i", [cell1 hammingDistanse:cell2]);
        
                [cell1 mutate:20];
                [cell2 mutate:80];
        
                NSLog(@"Hamming distance after mutation %i", [cell1 hammingDistanse:cell2]);
            
            
            }
        return 0;
    }

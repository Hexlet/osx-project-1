//
//  main.m
//  ver1
//
//  Created by Denis Sazonov on 11/8/12.
//  Copyright (c) 2012 Denis Sazonov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell1;
        Cell *cell2;
        
        cell1 = [[Cell alloc] init];
        cell2 = [[Cell alloc] init];
        
        
        // insert code here...
        NSLog(@"Cell 1 is %@",cell1);
        NSLog(@"Cell 2 is %@",cell2);

        NSLog(@"Hamming distance %i",[cell1 hammingDistance:cell2]);
        

                NSLog(@"Mutating ....");

        [cell1 mutate:10];
        [cell1 mutate:10];
        NSLog(@"Cell 1 after mutating is %@",cell1);
        NSLog(@"Cell 2 after mmutation is %@",cell2);
        
        NSLog(@"Hamming distance %i",[cell1 hammingDistance:cell2]);
        
        
    }
    return 0;
    
    
}


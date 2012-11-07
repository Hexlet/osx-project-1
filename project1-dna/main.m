//
//  main.m
//  project1-dna
//
//  Created by Артём on 07.11.12.
//
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+Mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell* cell1 = [[Cell alloc] init];
        Cell* cell2 = [[Cell alloc] init];
        
        [cell1 print];
        [cell2 print];
        
        NSLog(@"%d", [cell1 hammingDistance:cell2]);
        
        [cell1 mutate:10];
        [cell2 mutate:10];
        
        NSLog(@"%d", [cell1 hammingDistance:cell2]);
    }
    return 0;
}


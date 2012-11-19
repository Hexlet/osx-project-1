//
//  main.m
//  DNAapp
//
//  Created by Michael Krinitsky on 11/13/12.
//  Copyright (c) 2012 Michael Krinitsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#import "Cell+mutator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        Cell *myCell = [[Cell alloc] init];
        Cell *myCell2 = [[Cell alloc] init];
        int HammDistance = [myCell hammingDistance:myCell2.getDNA];
        NSLog(@"hamming distance before: %d", HammDistance);
        
        int current_rand1 = abs((int)arc4random()) % 100 + 1;
        [myCell mutate:current_rand1];
        int current_rand2 = abs((int)arc4random()) % 100 + 1;
        [myCell2 mutate:current_rand2];
        
        NSLog(@"Cell-1 DNA after mutation:");
        NSLog(@"%@", [myCell.getDNA componentsJoinedByString:@""]);
        NSLog(@"Cell-2 DNA after mutation:");
        NSLog(@"%@", [myCell2.getDNA componentsJoinedByString:@""]);
        HammDistance = [myCell hammingDistance:myCell2.getDNA];
        NSLog(@"Hamming distance after: %d", HammDistance);
    }
    
    return 0;
}


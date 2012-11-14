//
//  main.c
//  Project1-DNA
//
//  Created by ic-it on 11/14/12.
//  Copyright (c) 2012 ic-it. All rights reserved.
//

#include <Foundation/Foundation.h>
#include "Cell.h"

@interface Cell (Mutation)
- (void) mutate: (int) x;
@end

@implementation Cell (Mutation)
- (void) mutate: (int) x{
/*    NSMutableArray *pos = [[NSMutableArray alloc] initWithCapacity:x];
    bool overlap = YES;
    NSNumber *tmp = [[NSNumber alloc] initWithInt:0];
    int tmp2;
    for (int i=0;i<x;i++){
        while (overlap){
            tmp2 = random()%100;
            [tmp setValue:tmp2];
            tmp = random()%100;
            overlap = NO;
            for (int j=0;j<i;j++){
                if (tmp == (int)[pos objectAtIndex:j])
                    overlap = YES;
            }
            if (!overlap) [pos insertObject:(int)tmp atIndex:i];
        }
                    
    
    for (int i=0;i<x;i++){
        
    }
*/}

@end

int main(int argc, const char * argv[])
{

    // insert code here...
   // printf("Hello, World!\n");
    Cell *cell = [[Cell alloc]init];
    Cell *cell2 = [[Cell alloc]init];
    NSLog(@"%i",[cell hammingDistance:cell2]);
    [cell mutate:42];
    [cell2 mutate:33];
    NSLog(@"%i",[cell hammingDistance:cell2]);
   
    return 0;
    
}


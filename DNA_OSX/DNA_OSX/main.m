//
//  main.m
//  DNA_OSX
//
//  Created by aquaxp on 11/6/12.
//  Copyright (c) 2012 aquaxp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell(mutator)
-(void)mutate:(int) count;
@end

@implementation Cell(mutator)
-(void)mutate:(int) count{
    int changes = 0 ;
    int position[100];
    NSString *protein[4] = {@"A",@"T",@"G",@"C"};
    
    for(int i = 0; i < 100; i++) position[i] = 0; // generating map of DNA changes 
    
    while (changes < count) {
        int x = arc4random() % 100;
        
        if(position[x] != 0) continue; // if changed, trying next random number
        else{ // else change protein
            self.DNA[x] = protein[(arc4random() % 4)];
            position[x] += 1;
            changes++;
        }
    }
}
@end

int main(int argc, const char * argv[]){
    @autoreleasepool {
        Cell *cell0, *cell1;
        cell0 = [[Cell alloc]init];
        cell1 = [[Cell alloc]init];
        NSLog(@"%i", [cell0 hammingDistance:cell1]);
        [cell0 mutate:45];
        [cell1 mutate:45];
        NSLog(@"%i", [cell0 hammingDistance:cell1]);
    }
    return 0;
}


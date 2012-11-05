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
    NSInteger position[100];
    NSString *protein[4] = {@"A",@"T",@"G",@"C"};
    
    // black magic bycicle for generating unique random mutation position
    for(NSInteger i = 0; i < 100; i++){
        position[i] = -1;
    }
    while (changes < count) {
        int x = arc4random() % 100;
        for (int i = 0; i < count; i++) { // check for uniqueness
            if (position[i] == x){
                continue;
            }
            else{
                position[changes] = x;
                changes++;
                break;
            }
        }
    }
    for(int i = 0; i < count; i++){ // applying changes on DNA array
        self.DNA[position[i]] = protein[(arc4random() % 4)];
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell0, *cell1;
        cell0 = [[Cell alloc]init];
        cell1 = [[Cell alloc]init];
        NSLog(@"%i", [cell0 hammingDistance:cell1]);
        [cell0 mutate:12];
        [cell1 mutate:12];
        NSLog(@"%i", [cell0 hammingDistance:cell1]);
        
    }
    return 0;
}


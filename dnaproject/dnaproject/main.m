//
//  main.m
//  dnaproject
//
//  Created by Grisha Silver on 05.11.12.
//  Copyright (c) 2012 Grisha Silver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void)mutate:(int)x;

@end

@implementation Cell (mutator)

-(void)mutate:(int)x
{
    NSNumber *changeindex;
    NSMutableArray *mutA;
    NSString *change;
    int e;
    while (x) {
        do {
            changeindex=[NSNumber numberWithInt:(arc4random()%100)];
            } while ([mutA containsObject:changeindex]);
        
        do {
            e = arc4random() % 4+1;
            if(e==1){
                change=@"A";
            }
            else if(e==2){
                change=@"T";
            }
            else if (e==3){
                change=@"G";
            }
            else  change=@"C";
            } while ([DNA objectAtIndex:[changeindex intValue]]==change);
        [mutA insertObject:change atIndex:[changeindex intValue]];
        [DNA removeObjectAtIndex:[changeindex intValue]];
        [DNA insertObject:change atIndex:[changeindex intValue]];
        x--;
                }
   
    }
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1 = [[Cell alloc] init];
        Cell *cell2 = [[Cell alloc] init];
        NSLog(@"hamming dist=%i",[cell1 hammingDistance:cell2]);
        
        [cell1 mutate:35];
        [cell2 mutate:30];
        NSLog(@"hamming dist=%i",[cell1 hammingDistance:cell2]);
    }
    
    return 0;
}


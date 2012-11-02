//
//  main.m
//  DNA hexlet
//
//  Created by Eugene on 01.11.12.
//  Copyright (c) 2012 Eugene. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)

-(void)mutate:(int)value;

@end


@implementation Cell (mutator)

-(void)mutate:(int)value{
    NSArray *lettersArray=@[@"A",@"T",@"C",@"G"];
    NSMutableArray *usedIndexes=[[NSMutableArray alloc]initWithCapacity:100];
    int randomIndex=0;
    int randomIndex2=0;
    for(int index=0;index<value;index++){
        randomIndex =(int)(arc4random() % dna.count);
        randomIndex2=(int)(arc4random() % lettersArray.count);
        if(![usedIndexes containsObject:[NSNumber numberWithInt:randomIndex]]){
           [self.dna replaceObjectAtIndex:randomIndex withObject:[lettersArray objectAtIndex:randomIndex2]];
            [usedIndexes addObject:[NSNumber numberWithInt:randomIndex]];
            //NSLog(@"New index");
        }else{
            index--;
            //NSLog(@"Contains!");
        }
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        Cell *cell=[[Cell alloc]init];
        Cell *cell2=[[Cell alloc]init];
        NSLog(@"hammingDistance befor mutate=%d",[cell hammingDistance:cell2]);
        ///[cell print];
        //[cell2 print];
        [cell mutate:44];
        [cell2 mutate:53];
        NSLog(@"hammingDistance after mutate=%d",[cell hammingDistance:cell2]);
        //[cell print];
        //[cell2 print];

        
        
    }
    return 0;
}


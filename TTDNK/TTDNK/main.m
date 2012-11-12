//
//  main.m
//  TTDNK
//
//  Created by timur tarasenko on 03.11.12.
//  Copyright (c) 2012 timur tarasenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)

-(void) mutate : (int) value;

@end

@implementation Cell (Mutator)

-(void) mutate : (int) value
{
    
    //Это поможет выполнить рандомизированное изменение без повторов
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    for(int i = 0;i<100;i++)
        [tempArray addObject: [NSNumber numberWithInteger:i]];
    
     //замена значений по заданному количеству раз, исключая повторения:
    for(int i=0;i<value;i++)
    {        
       
        int idx = arc4random() % [tempArray count];
    
        [tempArray removeObjectAtIndex:idx];
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *primary= [[Cell alloc] init];
        Cell *minor = [[Cell alloc] init];
           
        NSLog(@"Hamming Distance before %i", [primary hammingDistance:minor]);
      
        NSLog(@"Mutate Primary...");
        [primary mutate:5];
        NSLog(@"Mutate Minor ...");
        [minor mutate:15];
        
        NSLog(@"Hamming Distance after %i", [primary hammingDistance:minor]);
        
    }
    return 0;
}


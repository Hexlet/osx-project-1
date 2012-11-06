//
//  main.m
//  HomeWork1
//
//  Created by Anton on 05.11.12.
//  Copyright (c) 2012 Anton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void)mutate:(int)x;
@end

@implementation Cell (mutator)
-(void)mutate:(int)x
{
    int randomCount;
    NSMutableArray *arrayForIndex = [[NSMutableArray alloc] init];
    NSMutableArray *arrayChars = [[NSMutableArray alloc] initWithObjects:@"A",@"T",@"G",@"C",nil];
    //Создаем массив
    for ( int i = 0; i < x; i++) {
        [arrayForIndex addObject:[NSNumber numberWithInt:i]];
    }
    //перемешиваем
    for ( int i = 0 ; i < x; i++) {
        
        int randomCount;
        randomCount = arc4random() % x;
        [arrayForIndex addObject:[NSNumber numberWithInt:randomCount]];
        [arrayForIndex removeObjectAtIndex:randomCount];
    }
    //меняем
    for ( int i = 0; i < x; i++) {
        randomCount = arc4random() % 4;
        [self.DNA insertObject:[arrayChars objectAtIndex:randomCount] atIndex:[[arrayForIndex objectAtIndex:i] integerValue]];
    }
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *myCell,*myCell2;
        myCell = [[Cell alloc] init];
        myCell2 = [[Cell alloc] init];
        NSLog(@"%i",[myCell hammingDistance:myCell2]);
        [myCell mutate:10];
        [myCell2 mutate:20];
         NSLog(@"%i",[myCell hammingDistance:myCell2]);
        
    }
    return 0;
}


//
//  main.m
//  dna
//
//  Created by Ilya Batozskiy on 31.10.12.
//  Copyright (c) 2012 Ilya Batozskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (mutator)
-(void) mutate:(int)X;
@end
@implementation Cell(mutator)

-(void) mutate:(int)X{
    int amino;
    NSMutableArray *numbers = [[NSMutableArray alloc] initWithCapacity:100];
    for (int i=0; i<100; i++) { //создаю массив чисел от 0 до 99 
        [numbers    addObject:[NSNumber numberWithInt:i]];
    }
    for (int i=0; i<X; i++) {
        amino = arc4random()%(99-i);
       
        switch (amino) {
            case 0:
                [self.DNA replaceObjectAtIndex:[[numbers objectAtIndex:amino] integerValue] withObject:@"A"];
                break;
            case 1:
                [self.DNA replaceObjectAtIndex:[[numbers objectAtIndex:amino] integerValue] withObject:@"T"];
                break;
            case 2:
                [self.DNA replaceObjectAtIndex:[[numbers objectAtIndex:amino] integerValue] withObject:@"G"];
                break;
            case 3:
                [self.DNA replaceObjectAtIndex:[[numbers objectAtIndex:amino] integerValue] withObject:@"C"];
                break;
        }
  
        [numbers removeObjectAtIndex:amino]; //убираем использованный элемент, чтобы номер не повторился
    
    }
    
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Cell *cell, *cell1;
        cell=[[Cell alloc]init];
        cell1=[[Cell alloc]init];
        NSLog(@"%i",[cell hammingDistance:cell1]);
        [cell1 mutate:10];
        [cell mutate:55];
        NSLog(@"%i",[cell hammingDistance:cell1]);
    }
    return 0;
}


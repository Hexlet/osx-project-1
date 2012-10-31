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
        int number;
        NSMutableArray *numbers = [[NSMutableArray alloc] initWithCapacity:100];
        for (int i=0; i<100; i++) { //создаю массив номеров от 0 до 99
                [numbers    addObject:[NSNumber numberWithInt:i]];
            }
        for (int i=0; i<X; i++) {
                number = arc4random()%(100-i); //выбираем случайной элемент из массива с номерами
            
                amino = arc4random()%4;
                switch (amino) {
                            case 0:
                                [self.DNA replaceObjectAtIndex:[[numbers objectAtIndex:number] integerValue] withObject:@"A"];
                                break;
                            case 1:
                                [self.DNA replaceObjectAtIndex:[[numbers objectAtIndex:number] integerValue] withObject:@"T"];
                                break;
                            case 2:
                                [self.DNA replaceObjectAtIndex:[[numbers objectAtIndex:number] integerValue] withObject:@"G"];
                                break;
                            case 3:
                                [self.DNA replaceObjectAtIndex:[[numbers objectAtIndex:number] integerValue] withObject:@"C"];
                                break;
                    }
        
                [numbers removeObjectAtIndex:number]; //убираем использованный элемент, чтобы номер не повторился
        
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



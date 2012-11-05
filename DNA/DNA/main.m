//
//  main.m
//  DNA
//
//  Created by Александр on 04.11.12.
//  Copyright (c) 2012 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (Mutator)
    -(void) mutate: (int) percent;
@end

@implementation Cell (Mutator)
    -(void) mutate: (int) percent {
         NSMutableArray *oldDNA=self.dna;
        
        //NSString *joinedStringFirst = [self.dna componentsJoinedByString:@""];
        //NSLog(@"До мутации ДНК: %@", joinedStringFirst);
        int i=0;
        while (i<=percent){
            int numCell=arc4random()%percent;
            
            int letterIntValue=arc4random()%4;
            NSObject *newCell;
            if(letterIntValue==0){
                newCell=@"A";
            } else if(letterIntValue==1){
                newCell=@"T";
            } else if(letterIntValue==2){
                newCell=@"G";
            } else {
                newCell=@"C";
            }
            
            //Следим чтобы ячейки в старом массиве не совпадали с новым и за тем что Ячейка не совпадала с тем чем будем менять

            if(![[oldDNA objectAtIndex:numCell] isEqual: [self.dna objectAtIndex:numCell]] || [oldDNA objectAtIndex:numCell]!=newCell){
                [self.dna replaceObjectAtIndex:numCell withObject:newCell];
                i++;
            } 
        }
    }
@end;

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *dnaFirst, *dnaSecond;
        //Выделяем память и инициализируем объект 1
        dnaFirst=[[Cell alloc ] init];
        
         //Выделяем память и инициализируем объект 2
        dnaSecond=[[Cell alloc ] init];
        
        //Выводим 2 днк до мутации на экран
        [dnaFirst printDnas: dnaSecond];
        
        //Выводим разницу между ними.
        NSLog(@"Разница %d",[dnaFirst hammingDistance:dnaSecond]);
        
        
        //Мутируем
        NSLog(@"Мутация");
        [dnaFirst mutate:5];
        [dnaSecond mutate:5];
        [dnaFirst printDnas: dnaSecond];
        NSLog(@"Разница %d",[dnaFirst hammingDistance:dnaSecond]);
        
        
    }
    return 0;
}


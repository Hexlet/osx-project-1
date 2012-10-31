//
//  main.m
//  Cell
//
//  Created by Игорь Алюшев on 30.10.12.
//  Copyright (c) 2012 Игорь Алюшев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"


@interface Cell(mutator);
-(void)mutator:(int) x;
@end

@implementation Cell(mutator);


-(void)mutator:(int)x{
    NSMutableArray *done=[[NSMutableArray alloc]init]; // здесь будем хранить массив уже замененных элементов
    int counter=0;//заведем счетчик уже замененных элементов
    
    while(counter<x){ //замена еще в процессе
        int index=arc4random() % 100; //получим случайный индекс
        BOOL isContains=NO;
        for(id item in done){
            if([item integerValue]==index)isContains=YES; //индекс уже использован
        }
        if(isContains==NO){ //еще не использован
            // получим новый элемент
            NSString *newValue=[self getRandomChar];
            //получим принципиально другое значение
            while([self isEqualItem:newValue atIndex:index]==YES) newValue=[self getRandomChar];
          
            //заменим символ
            [self.dna replaceObjectAtIndex:index withObject:newValue];
            
            // добавим в список уже использованных индексов
            [done addObject:[NSNumber numberWithInt:index]];
            counter++;
        }
        
    }
}

@end



int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Cell *cell1=[[Cell alloc] init];
        Cell *cell2=[[Cell alloc]init];
        NSLog(@"hamming distance is %d",[cell1 hammingDistance:cell2]);
        
        [cell1 mutator:5];
        [cell2 mutator:32];
        
        NSLog(@"hamming distance after mutation is %d",[cell1 hammingDistance:cell2]);
    }
    return 0;
}


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
    //NSMutableArray *done=[[NSMutableArray alloc]initWithCapacity:x]; // здесь будем хранить массив уже замененных элементов
    int cDone[x];
    for(int cc=0;cc<x;cDone[cc++]=-1); // первоначальная инициализация в -1
    int counter=0;//заведем счетчик уже замененных элементов
    
    while(counter<x){ //замена еще в процессе
        int index=arc4random() % 100; //получим случайный индекс
        BOOL isContains=NO;
        for(int cc=0;cc<index;cc++){
            if(cDone[cc]==index){
                isContains=YES; //индекс уже использован
                break;
            }
        }
        if(isContains==NO){ //еще не использован
            // получим новый элемент
            NSString *newValue=[self getRandomChar];
            //получим принципиально другое значение
            while([self isEqualItem:newValue atIndex:index]==YES) newValue=[self getRandomChar];
          
            //заменим символ
            [self.dna replaceObjectAtIndex:index withObject:newValue];
            
            // добавим в список уже использованных индексов
            //[done addObject:[NSNumber numberWithInt:index]];
            cDone[x]=index;
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


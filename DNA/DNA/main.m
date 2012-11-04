//
//  main.m
//  DNA
//
//  Created by Evgeniy Kozachenko on 04.11.12.
//  Copyright (c) 2012 Evgeniy Kozachenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell  (Mutation)
-(void) mutate: (int) percent;
@end

@implementation Cell (Mutation)
-(void) mutate:(int)percent{
    NSArray *tmp=[[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
    //множество возможных значений
    int step=100/percent;
    //шаг мутации (чтобы каждый раз новый ген мутировать)
    //Здорово, что не выбивает ошибку, а само округляет (если при делении получается float)
    for(int i=0;i<100;i+=step)
        [DNA replaceObjectAtIndex:i withObject:[tmp objectAtIndex:rand()%4]];
        //заменяем в нужном месте ген случайным
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Cell *myCell=[[Cell alloc] init];
        Cell *myCell2=[[Cell alloc] init];
        NSLog(@"hamming distance = %i",[myCell hammingDistance:myCell2]);
        //считаем и выводим разницу
        [myCell mutate:25];
        //мутируем первый ДНК
        [myCell2 mutate:25];
        //мутируем второй ДНК
        NSLog(@"hamming distance2 = %i",[myCell hammingDistance:myCell2]);
        //считаем и выводим разницу
    }
    return 0;
}


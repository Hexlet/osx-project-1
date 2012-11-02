//
//  main.m
//  osx-project-1
//
//  Created by Alexander Kazanskiy on 30.10.12.
//  Copyright (c) 2012 haxlet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Cell (muttator)

-(void) mutate: (int)numebr;

@end

@implementation Cell (muttator)

-(void) mutate:(int)num{

    int numMutate = (self->capacity/100) * num;
    //Масив будет содержать уже мутировавшие гены
    NSMutableArray *checkPosition = [NSMutableArray arrayWithCapacity:numMutate];
    for (int i=0; i<numMutate; i++)
    {
        //Генерим случайный номер гена который будет изменятся
        NSNumber *r =  [NSNumber numberWithInt: arc4random() % self->capacity];
        //Проверяем не мутировал ли уже этот ген
        if ([checkPosition indexOfObject: r]){
            //Генерируем ген
            id newGen = [Cell getRandGen];
            //Проверям не совпадает ли новый ген с существующим
            //По логике мутация подразумевет замена гена на новый, отличающейся от сущетвующего, соответсвенно если
            //заменяемый ген и существующий одинаковы то мутация не произойдет.
            if([[self->DNA objectAtIndex:[r integerValue]] isEqual:newGen]){
                //Если гены совпадают то уменьшаем индекс итерации чтоб попробывать снова.
                i--;
            } else {
                //если гены различны добавляем номер мутирующего гена в чак массив
                [checkPosition insertObject:r atIndex:i];
                //Заменяем ген
                [self->DNA replaceObjectAtIndex:[r integerValue]  withObject: newGen];
            }
        } else {
            //Если ген уже прошел мутацию уменьшаем индекс чтобы попробывать снова.
            i--;
            //NSLog(@" match %@", r );
        }
    }
}

@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Cell *cellOne = [[Cell alloc] init];
        Cell *cellTwo = [[Cell alloc] init];
        int matches = [cellOne hummingDistance: cellTwo];
        NSLog(@"Match gens %d",matches);
        
        [cellOne mutate:10];
        [cellTwo mutate:20];
        matches = [cellOne hummingDistance: cellTwo];
        NSLog(@"Match gens %d",matches);

    }
    return 0;
}


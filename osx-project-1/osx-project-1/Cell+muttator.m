//
//  Cell+muttator.m
//  osx-project-1
//
//  Created by Alexander Kazanskiy on 04.11.12.
//  Copyright (c) 2012 haxlet. All rights reserved.
//

#import "Cell+muttator.h"

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
        if (![checkPosition containsObject: r]){
            //Генерируем ген
            id newGen = [Cell getRandGen];
            //Проверям не совпадает ли новый ген с существующим
            //По логике мутация подразумевет замена гена на новый, отличающейся от сущетвующего, соответсвенно если
            //заменяемый ген и существующий одинаковы то мутация не произойдет.
            while ([[self->DNA objectAtIndex:[r integerValue]] isEqual:newGen]) {
                newGen = [Cell getRandGen];
            }
            //если гены различны добавляем номер мутирующего гена в чек массив
            [checkPosition insertObject:r atIndex:i];
            //Заменяем ген
            [self->DNA replaceObjectAtIndex:[r integerValue]  withObject: newGen];
        } else {
            //Если ген уже прошел мутацию уменьшаем индекс чтобы попробывать снова.
            i--;
            //NSLog(@" match %@", r );
        }
    }
}


@end

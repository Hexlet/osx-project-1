//
//  Cell.m
//  osx-project-1
//
//  Created by Alexander Kazanskiy on 30.10.12.
//  Copyright (c) 2012 haxlet. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(id) init{
    self = [super init];
    if(self) {
        
        //Размер масива DNA
        capacity = 100;
        
        if (capacity < 0){
            NSLog(@"DNA не может иметь отрицательный размер.");
            exit(1);
        }

        //Инициализации масива с определнным размером
        DNA = [[NSMutableArray alloc] initWithCapacity:capacity];
        //Заполнение массива случайными генам
        for (int i = 0; i<capacity; ++i) {
            [DNA insertObject:[Cell getRandGen] atIndex:i ];
        }
    }
    
    return self;
}

-(int)hummingDistance:(Cell *)c {
    //В начале мы не имеем совпадений
    int counter = 0;
    
    for (int i = 0; i<capacity; ++i) {
        //Получаем свой ген
        NSString * myGen = [self->DNA objectAtIndex:i];
        //Если гены сопадают
        if(![myGen isEqual: [c->DNA objectAtIndex: i]]){
            //увеличиваем счетчик совпадений
            counter++;
        }
    }
    return counter;
}

+(id) getRandGen {
    //массив содержит возможные гены
    NSArray *arr = [NSArray arrayWithObjects:@"A",@"T",@"G",@"C",nil];
    //Случайный номер гена
    NSUInteger r = arc4random() % [arr count];
    //возвращаем ген
    return [arr objectAtIndex:r];

}

@end

//
//  Cell.m
//  DNA
//
//  Created by Александр on 04.11.12.
//  Copyright (c) 2012 Александр. All rights reserved.
//

#import "Cell.h"

@implementation Cell
-(id) init {
    self=[super init];
    if(self){
        _dna=[NSMutableArray arrayWithCapacity:100];
        for (int i=0; i<100; i++){
            int letterIntValue;
            letterIntValue=arc4random()%4;
            if(letterIntValue==0){
                [_dna addObject:@"A"];
            } else if(letterIntValue==1){
                [_dna addObject:@"T"];
            } else if(letterIntValue==2){
                [_dna addObject:@"G"];
            } else {
                [_dna addObject:@"C"];
            }
        }
    }
    return self;
}

-(int) hammingDistance:(Cell *)f{
    
    //Объявляем счетчик
    int hammingDistance=0;
    
    //Если расхождение есть в массивах то крутим счетчик
    for (int i=0;i<[self.dna count];i++){
        if (![[self.dna objectAtIndex:i] isEqual:[f.dna objectAtIndex:i]]){
        hammingDistance++;
        }
    }
    
    return hammingDistance;
}
 
-(id) getString{
    //Превращаем в строки массивы
    NSString *joinedStringFirst = [self.dna componentsJoinedByString:@""];
    
    //Выводим
    return joinedStringFirst;
}


@end

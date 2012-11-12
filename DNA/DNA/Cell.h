//
//  Cell.h
//  DNA
//
//  Created by Администратор on 11/2/12.
//  Copyright (c) 2012 Nope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    NSMutableArray *DNA;
}

-(NSString*) nucleotideAtIndex: (int) Index;    //Списывать нехорошо, но иного решения не вижу
-(void) show;                                   //Выводим массив в консоль
-(int) hammingDistance:(Cell*) enemyDNA;        //Определяем степень различия
@end

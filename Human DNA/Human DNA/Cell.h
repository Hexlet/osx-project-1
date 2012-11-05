//
//  Cell.h
//  Human DNA
//
//  Created by Dmitry Marenich on 11/4/12.
//  Copyright (c) 2012 Dmitry Marenich. All rights reserved.
//

#import <Foundation/Foundation.h>

// класс Cell, который наследуется от NSObject.
@interface Cell : NSObject
@property NSArray *arrayOfChars;
@property NSMutableArray *DNA;

-(id) init;
-(id) createDNA;
// Создаем метод hammingDistance, который возвращает int и принимает объект класса Cell
-(int) hammingDistance:(Cell *) cell;
@end
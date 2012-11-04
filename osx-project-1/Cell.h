//
//  Cell.h
//  osx-project-1
//
//  Created by Eugene Krymov on 03.11.12.
//  Copyright (c) 2012 ekrymov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA; // Свойства для работы с массивом DNA
@property NSArray *symbols;    // Свойства для работы с массивом символов

-(int) hammingDistance:(Cell *) f; // Описание метода hammingDistance: возвращает int, принимает Cell

@end

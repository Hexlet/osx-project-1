//
//  Cell.h
//  Assignment1
//
//  Created by Alex Altabaev on 01.11.12.
//  Copyright (c) 2012 Alex Altabaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    @public
    NSMutableArray *DNA; // массив для ДНК - длину не указываю - на то он и mutable
    NSMutableArray *letters; // массив букв для набора значений A, C, G, T
    int lenght; // максимальный индекс для массива ДНК
}

-(int) hammingDistance: (Cell *) c;

@end

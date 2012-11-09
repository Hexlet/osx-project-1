//
//  Cell.h
//  DNK
//
//  Created by eldar on 06.11.12.
//  Copyright (c) 2012 eldar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject 

    @property NSMutableArray *DNA;

    //процедура вывода
    - (void) print;

    //процедура вычисления разности
    - (int) hammingDistance : (Cell *) withCell;

-(id)copyWithZone:(NSZone *)zone;

@end

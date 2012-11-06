//
//  Cell.h
//  mac101p1DNA
//
//  Created by Voleg on 31.10.12.
//  Copyright (c) 2012 Voleg. All rights reserved.
//

#import <Foundation/Foundation.h>

// 2. Наследуем NSObject

@interface Cell : NSObject {
    @public NSMutableArray *DNA;
    NSArray *mols;
}

-(id) init;
-(id) initLength:(int) l; // Похоже Obj-C неподдерживает Default Argument Value
-(NSMutableArray *) makeDNA:(int) l;
-(int) hammingDistance: (Cell *) cell;

@end

// 6. Добавляем категорию с методом mutate

@interface Cell (mutator)
-(void) mutate: (int) x;
@end
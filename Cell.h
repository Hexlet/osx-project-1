//
//  Cell.h
//  DNK
//
//  Created by Администратор on 11/6/12.
//  Copyright (c) 2012 witem.artem@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
    int count;
    int size;
}


-(int) hammingDistance: (Cell *) newDNA;
//-(void) print;

@end

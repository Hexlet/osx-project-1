//
//  Cell.h
//  Lab_DNK_Shpilevoy
//
//  Created by Stanislav Shpilevoy on 01.11.12.
//  Copyright (c) 2012 Stanislav Shpilevoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSSet * array;
}

@property (strong, nonatomic ,readonly) NSMutableArray *DNA; // создаем переменную  DNA

    -(void) print; // метод вывода на печать

    -(int) hammingDistance:(Cell*) partOfCell; // метод , позволяющий сравнивать две разных днк и возвращать количество несовпадающих позиций

@end

@interface Cell (Mutator)

    -(void) mutate : (int) R; // категория класса , заменяюший определенное количество генов в массиве


@end
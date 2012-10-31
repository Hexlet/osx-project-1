//
//  Cell.h
//  DNAProject
//
//  Created by S.Lebedev on 30.10.12.
//  Copyright (c) 2012 S.Lebedev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA; //собственно, ДНК
    NSUInteger capacityOfDNA; //вспомогательная переменная, для хранения количества символов в последовательности
    NSArray *gene; //набор генов
}
/* метод, определяющий, насколько одна последовательность отличается от другой,
   возвращает количество позиций, на которых есть несоответствие */
-(int)hammingDistance:(Cell *)someCell;
@end

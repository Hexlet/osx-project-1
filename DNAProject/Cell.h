//
//  Cell.h
//  DNAProject
//
//  Created by S.Lebedev on 30.10.12.
//  Copyright (c) 2012 S.Lebedev. All rights reserved.
//

#import <Foundation/Foundation.h>

#define capacityOfDNA 100 //количество генов в последовательности ДНК
#define capacityOfGene 4 //количество генов в одной ячейке ДНК

extern const NSString *gene[capacityOfGene]; // чтобы не создавать каждый раз новые для каждого объекта

@interface Cell : NSObject {
    NSMutableArray *DNA; //собственно, ДНК
}
/* метод, определяющий, насколько одна последовательность отличается от другой,
   возвращает количество позиций, на которых есть несоответствие */
-(int)hammingDistance:(Cell *)someCell;
@end

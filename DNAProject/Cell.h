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

@interface Cell : NSObject {
    NSMutableArray *DNA; //собственно, ДНК
}

@property (nonatomic,readonly) NSArray *DNA; // ридонли свойство для доступа извне

-(NSString *)getRandomGene; // для формирования случайного символа
-(int)hammingDistance:(Cell *)someCell; // подсчёт хэммингова числа
@end

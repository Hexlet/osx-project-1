//
//  Cell.h
//  DNAProject
//
//  Created by S.Lebedev on 30.10.12.
//  Copyright (c) 2012 S.Lebedev. All rights reserved.
//

#import <Foundation/Foundation.h>
//#define debug // директива для включения отладочных сообщений

#define capacityOfDNA 100 //количество генов в последовательности ДНК

@interface Cell : NSObject {
    NSMutableArray *DNA; //собственно, ДНК
}

@property (nonatomic,readonly) NSArray *DNA; // ридонли свойство для доступа извне
-(id)initWithCell:(Cell *)cell;
+(NSString *)getRandomGene; // для формирования случайного символа
+(NSString *)getRandomGene:(id)replacingGene; // для формирования случайного символа на замену
-(int)hammingDistance:(Cell *)someCell; // подсчёт хэммингова числа
-(id)geneAtIndex:(NSUInteger)index; // получить ген в определённой позиции ДНК
@end

//
// Created by eugenedymov on 31.10.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

/* Количество элементов */
#define kCellDNALength 100

@interface Cell : NSObject

/* Массив элементов */
@property(strong, readonly) NSMutableArray *dna;

/* Возвращает расстояние Хэмминга */
- (int)hammingDistance:(Cell *)toCell;

@end
//
//  Cell.h
//  DNA
//
//  Created by Александр Борунов on 01.11.12.
//  Copyright (c) 2012 Александр Борунов. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "Protein.h"


#define CHAIN_LENGTH 100

@interface Cell : NSObject {
    NSMutableArray *chain;  // цепочку из Proteine храним тут
    
}



- (int) hammingDistance: (Cell*)comparedCell;  // метод для проверки "различий" двух цепочек генов. просто количество отличий в штуках

// то что мне нужно для отладки и удобства работы:

- (void) print;  // напечатать всю цепочку
- (id) initFromCell: (Cell*)sourceCell; // иногда хочется создать цепочку копированием
- (id) initFromString: (NSString*)sourceString;  // иногда хочется создать цепочку из строки
- (void) setAinIndex: (int) index; // проверочка. элемент index устанавливаем в A


@end



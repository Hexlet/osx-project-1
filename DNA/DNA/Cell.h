//
//  Cell.h
//  DNA
//
//  Created by NordWind on 05.11.12.
//  Copyright (c) 2012 YurySokolov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

//Наш массив, в котором после инициализации появится последовательность нуклеотидов
@property (readonly) NSMutableArray *DNA;
@property (readonly) NSArray *nucleotide;
@property (readonly) int nucleotideCount;

// Метод рассчитывает количество изменений ДНК относительно родной.
-(int)hammingDistance:(Cell*) obj;

@end

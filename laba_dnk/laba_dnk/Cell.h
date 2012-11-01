//
//  Cell.h
//  laba_dnk
//
//  Created by Smallkot on 31.10.12.
//  Copyright (c) 2012 Smallkot. All rights reserved.
//

#import <Foundation/Foundation.h>
//класс Cell наследуется NSObject
@interface Cell : NSObject{
    NSMutableArray *DNK; // массив ДНК размер = 100
    NSMutableArray *MassElementovDNK; // массив элементов ДНК размер = 4 состоит из @"A", @"T", @"G", @"C"
}

-(NSString *)getEletmentArray; // возращает случайны элемент из массива MassElementovDNK
-(int)hammingDistance:(Cell*) theCell; // метод сравнивает ДНК объекта с ДНК передаваемого объекта
-(void)print; // выводим ДНК объкта

@end

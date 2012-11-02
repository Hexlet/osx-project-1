//
//  Cell.h
//  DNK
//
//  Created by someone on 11/1/12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    int             DNALength;          // Длина DNA
    NSArray         *aphabet;           // Набор символов для формирования DNA
    unsigned long   alphabetLength;     // Количество символов в наборе
}

@property NSMutableArray *DNA;

-(int) hammingDistance: (Cell *) anotherDNA;
-(NSString *) generateGen;
-(void) print;

@end

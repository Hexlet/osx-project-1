//
//  Cell.h
//  task_1_dna
//
//  Created by Sergey Sh on 05.11.12.
//  Copyright (c) 2012 Sergey Sh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    
//    int count;
//    NSMutableArray *DNA;        // массив для хранения элементов гена
//    NSMutableString *dnaString; // строковое представление гена

}

@property (nonatomic) int count;
@property (nonatomic) NSMutableArray *DNA;        // массив для хранения элементов гена
@property (nonatomic) NSMutableString *dnaString; // строковое представление гена

-(void) createDNA;
-(int) hammingDistance: (Cell *) otherDNA;
-(NSString *) getDNAString;
-(NSString *) getUnit;

@end

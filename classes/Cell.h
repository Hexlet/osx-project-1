//
//  Cell.h
//  DNA
//
//  Created by wumin on 06.11.12.
//  Copyright (c) 2012 wumin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    int numLenghtDNA;
    NSMutableArray *DNA;
    NSArray *acids;
}
-(id)initWhisLenghtDna: (int) LenghtDNA;
-(NSArray *)getDNA;
-(int)hammingDistance: (Cell *) cell;
//-(int)lDNA;

@end

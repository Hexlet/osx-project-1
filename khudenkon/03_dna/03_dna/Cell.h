//
//  Cell.h
//  03_dna
//
//  Created by Stas on 11/2/12.
//  Copyright (c) 2012 Stas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    NSMutableArray *dna;
}
-(int) hammingDistance: (Cell*) cell;       // прототип метода hammingDistance
-(void) print;                              // прототип метода print (для наглядности)
@end

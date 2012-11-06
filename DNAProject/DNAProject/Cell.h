//
//  Cell.h
//  DNAProject
//
//  Created by Valery Kharshats on 11/3/12.
//  Copyright (c) 2012 Valery Kharshats. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *_DNA;
    NSMutableArray *_mutatedElements;
    int CELL_LENGTH;
}

-(void) printArray;
-(NSString*) generateElement;
-(NSMutableArray*) getArray;
-(int) hammingDistance: (Cell*) c;

@end


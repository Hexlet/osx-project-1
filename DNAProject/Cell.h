//
//  Cell.h
//  DNAProject
//
//  Created by alex on 31/10/2012.
//  Copyright (c) 2012 alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
    NSArray *DNAElements; // A, T, G и C
}

-(id) init;
-(int) hammingDistance: (Cell*) cell;
-(NSMutableArray*) getDNA;

// нужно для тестирования
+(id) copyCell: (Cell*) cell;

@end

@interface Cell (mutator)

-(void) mutate: (int)X;

@end

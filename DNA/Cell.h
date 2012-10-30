//
//  Cell.h
//  DNA
//
//  Created by Kirill Morozov on 30.10.12.
//  Copyright (c) 2012 Kirill Morozov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
}

@property int dnkArrayLength;
@property NSMutableArray *nucleotides;

-(void) printDNA;
-(int) hammingDistance: (Cell *)obj;
@end

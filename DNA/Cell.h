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

@property (readonly) int dnkArrayLength;
@property (readonly) NSMutableArray *nucleotides;

-(NSString *) description;
-(int) hammingDistance: (Cell *)obj;
@end

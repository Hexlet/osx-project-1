//
//  Cell.h
//  DNA
//
//  Created by Kirill Morozov on 30.10.12.
//  Copyright (c) 2012 Kirill Morozov. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DNA_LEN     100
#define NUKE_LEN    4
#define NUKE_ARR    @[@"A",@"T",@"G",@"C"]

extern NSMutableArray *nucleotides;

@interface Cell : NSObject {
    NSMutableArray *DNA;
}
-(int) hammingDistance: (Cell *)obj;
@end

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

extern NSMutableArray *nucleotides;

@interface Cell : NSObject {
    NSMutableArray *DNA;
}
-(NSArray *) possibleNucleotides;
-(void) setDNA: var;
-(NSString *) description;
-(int) hammingDistance: (Cell *)obj;
@end

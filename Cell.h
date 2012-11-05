//
//  Cell.h
//  DNAProject
//
//  Created by test on 05.11.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *DNA;
}

-(id)init;
-(id)getGene: (int) Pos;
-(int)hammingDistance: (Cell *) BCell;
@end

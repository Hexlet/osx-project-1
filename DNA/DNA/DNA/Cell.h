//
//  Cell.h
//  DNA
//
//  Created by Rashid Bakhmudov on 09-11-2012.
//  Copyright (c) 2012 Rashid Bakhmudov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{

    NSMutableArray *DNA;
}

-(NSString *)getNewSymbol;
-(int)hammingDistance:(Cell *)toCell;
-(NSArray *)getDNA;

@end

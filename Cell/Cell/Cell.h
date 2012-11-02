//
//  Cell.h
//  Cell
//
//  Created by Игорь Алюшев on 30.10.12.
//  Copyright (c) 2012 Игорь Алюшев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"


@interface Cell : NSObject{
    NSArray *templ;
}
@property NSMutableArray* dna;
-(int)hammingDistance: (Cell*)theCell;
-(NSString*)getRandomChar;

@end

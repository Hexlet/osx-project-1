//
//  Cell.h
//  DNK
//
//  Created by Администратор on 11/3/12.
//  Copyright (c) 2012 Rustam. All rights reserved.
//

#import <Foundation/Foundation.h>

    
@interface Cell : NSObject

+(NSString*) getRndCellElement;

@property(readonly) NSMutableArray *DNA;

-(int) hammingDistance: (Cell*) cell;

@end

//
//  Call.h
//  DNK
//
//  Created by Администратор on 11/6/12.
//  Copyright (c) 2012 witem.artem@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Call : NSObject {
    NSMutableArray *DNA;
    int count;
    int size;
}


-(int) hammingDistance: (Call *) newDNA;
//-(void) print;

@end

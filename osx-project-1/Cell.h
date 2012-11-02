//
//  Cell.h
//  osx-project-1
//
//  Created by Максим Пелевин on 02.11.12.
//  Copyright (c) 2012 Максим Пелевин. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    
    NSMutableArray *DNA;
    
}

-(int) hammingDistance: (Cell*) cell;

@end

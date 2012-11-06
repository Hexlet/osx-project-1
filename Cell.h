//
//  Cell.h
//  DNAProject
//
//  Created by Maxim Tushevskiy on 05.11.12.
//  Copyright (c) 2012 Maxim Tushevskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    int size;
    NSArray *letters;
    NSMutableArray *DNA;
}
-(id)init;
-(int)hammingDistance:(Cell*)cell;
-(NSMutableArray*)DNA;
@end

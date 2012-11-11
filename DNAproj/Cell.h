//
//  Cell.h
//  DNAproj
//
//  Created by Иван Иванов on 10.11.12.
//  Copyright (c) 2012 Иван Иванов. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property NSMutableArray *DNA, *wDNA, *wElements; //work DNA and elements *wDNA and *wElements for mark changed values in mutate method


-(void) printDNA;
-(int) hammingDistance: (Cell*)c;

    

@end
